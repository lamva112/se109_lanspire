import 'package:flutter/material.dart';
import 'package:se109_lanspire/core/base/loading_widget.dart';
import '../../../data/data.dart';
import '../../../utils/dialog_utils.dart';
import '../user_information/user_information.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';
import '../../../core/base/base.dart';

import '../../../blocs/blocs.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;
  final CourseBloc courseBloc;
  final ExamScheduleBloc examScheduleBloc;
  final UserInformationBloc userInformationBloc;
  final TimeTableBloc timeTableBloc;
  final MarkSheetBloc markSheetBloc;

  const HomePage({
    Key? key,
    required this.bloc,
    required this.courseBloc,
    required this.examScheduleBloc,
    required this.userInformationBloc,
    required this.timeTableBloc,
    required this.markSheetBloc,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  bool isDataInit = true;
  String userId = "d3fd4627-7afa-48bf-95a0-90f6194bdef8";
  int currentIndex = 0;
  final bottomBarIcons = [
    Assets.images.png.grade,
    Assets.images.png.task,
    Assets.images.png.graduate,
    Assets.images.png.avatar,
    Assets.images.png.clockCircular,
  ];

  final bottomBarActiveIcons = [
    Assets.images.png.grade,
    Assets.images.png.task,
    Assets.images.png.graduate,
    Assets.images.png.avatar,
    Assets.images.png.clockCircular
  ];

  List<String> bottomBarTitles = [];

  late List<Widget> tabScreens = [
    MarkSheetPage(bloc: widget.markSheetBloc),
    ExamSchedulePage(bloc: widget.examScheduleBloc),
    CoursePage(bloc: widget.courseBloc),
    UserInformationPage(bloc: widget.userInformationBloc),
    TimeTablePage(bloc: widget.timeTableBloc)
  ];

  void _initBottomBarTitles() {
    if (bottomBarTitles.isEmpty) {
      bottomBarTitles.addAll([
        localization.grade,
        localization.exam,
        localization.class_room,
        localization.personal,
        localization.time_table,
      ]);
    }
  }

  void _getArgumentData() {
    try {
      var data = ModalRoute.of(context)?.settings.arguments as UserModel?;
      userId = data?.idUser??"";
      //widget.userInformationBloc.getUserData(data);
    } catch (err) {
      print('Get user data error ::: $err');
    }
  }

  @override
  void initState() {
    bloc.getStudentData(userId: userId);
    bloc.errorStream.listen((event) {
      if (event != null) {
        showAppDialog(
          context: context,
          errMsg: event,
          title: event,
          onConfirm: () {
            Navigator.pop(context);
          },
        );
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if(isDataInit){
      _initBottomBarTitles();
      _getArgumentData();
      isDataInit = false;
    }

    return Scaffold(
      body: StreamBuilder<StudentResponse?>(
        stream: bloc.studentStream,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return LoadingWidget();
          }
          var classes = snapshot.data?.classes??[];
          var exams = snapshot.data?.exams;
          widget.courseBloc.getClassesData(classes);
          widget.markSheetBloc.getListExam(exams);
          widget.examScheduleBloc.getListExam(exams);
          widget.timeTableBloc.getClassesData(classes);
          return IndexedStack(
            children: tabScreens,
            index: currentIndex,
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        items: List.generate(
          bottomBarIcons.length,
          (index) => BottomNavigationBarItem(
            icon: bottomBarIcons[index].image(
              width: 24.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
            label: bottomBarTitles[index],
            activeIcon: bottomBarActiveIcons[index].image(
              width: 24.0,
              height: 24.0,
              color: AppColors.primaryBlueBerry,
              fit: BoxFit.cover,
            ),
          ),
        ),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.primaryBlueBerry,
        selectedLabelStyle: Theme.of(context).textTheme.caption?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlack,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.caption?.copyWith(
              fontWeight: FontWeight.w500,
               color: AppColors.primaryCyan
            ),
      ),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
