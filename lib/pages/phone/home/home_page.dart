import 'package:flutter/material.dart';
import '../../pages.dart';
import '../../../core/base/base.dart';

import '../../../blocs/blocs.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;
  final CourseBloc courseBloc;
  final ExamScheduleBloc examScheduleBloc;
  const HomePage({Key? key, required this.bloc, required this.courseBloc, required this.examScheduleBloc}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage,HomeBloc> {
  int currentIndex = 0;
  final bottomBarIcons = [
    Assets.images.png.classRoom,
    Assets.images.png.avatar,
    Assets.images.png.exam,
  ];

  final bottomBarActiveIcons = [
    Assets.images.png.classRoom,
    Assets.images.png.avatar,
    Assets.images.png.exam,
  ];

  List<String> bottomBarTitles = [];

  late List<Widget> tabScreens = [
    CoursePage(bloc: widget.courseBloc),
    Scaffold(),
    ExamSchedulePage(bloc: widget.examScheduleBloc)
  ];

  void _initBottomBarTitles() {
    if (bottomBarTitles.isEmpty) {
      bottomBarTitles.addAll([
        localization.class_room,
        localization.personal,
        localization.course,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initBottomBarTitles();
   return Scaffold(
     body: IndexedStack(
       children: tabScreens,
       index: currentIndex,
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
             color: AppColors.primaryBlueBall,
             fit: BoxFit.cover,
           ),
         ),
       ),
       currentIndex: currentIndex,
       type: BottomNavigationBarType.fixed,
       fixedColor: AppColors.primaryWhite,
       selectedLabelStyle: Theme.of(context).textTheme.caption?.copyWith(
         fontWeight: FontWeight.w500,
         color: AppColors.primaryBlueBerry,
       ),
       unselectedLabelStyle: Theme.of(context).textTheme.caption?.copyWith(
         fontWeight: FontWeight.w500,
       ),
     ),
   );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
