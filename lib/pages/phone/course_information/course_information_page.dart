import 'package:flutter/material.dart';
import 'package:se109_lanspire/data/models/course_model.dart';
import 'package:se109_lanspire/data/responses/class_detail_response.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../resources/colors.dart';
import 'widget/bottom_line_indicator.dart';
import 'widget/information_card.dart';

class CourseInformationPage extends StatefulWidget {
  final CourseInformationBloc bloc;

  const CourseInformationPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<CourseInformationPage> createState() => _CourseInformationPageState();
}

class _CourseInformationPageState extends BaseState<CourseInformationPage, CourseInformationBloc> with TickerProviderStateMixin {
  late TabController _tabController;
  String classId = '';
  List<String> classTime = [
    "14:00 - 17:00 | Tue",
    "14:00 - 17:00 | Tue",
    "14:00 - 17:00 | Tue",
    "14:00 - 17:00 | Tue",
  ];

  List<String> lectureList = ["Nguyen Ngoc Hoang Minh", "Nguyen Quang Sang", "Tran Van Minh", "Duong Van Qua"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void initData() {
    getData();
    print("classID ${classId}");
    bloc.getClassDetailData(classId: classId);
    super.initData();
  }

  void getData() {
    try {
      var data = ModalRoute.of(context)?.settings.arguments as String;

      classId = data;
    } catch (e) {
      print('Get class error ::: $e');
    }
  }

  String formatText(String text) {
    final regex = RegExp(r'^(\d{4})(\d{4})(\d{4})(\d{4})$');
    return text.replaceAllMapped(regex, (match) {
      return '${match[1]} - ${match[2]} - ${match[3]} - ${match[4]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLotion,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryWhite,
        //automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryBlack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          localization.information,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primaryBlack,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: TabBar(
          padding: EdgeInsets.symmetric(horizontal: 17),
          labelColor: AppColors.primaryBlueBerry,
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.primaryGay,
          ),
          indicator: BottomLineIndicator(
            color: AppColors.primaryBlueBerry,
            height: 4,
          ),
          labelPadding: EdgeInsets.only(bottom: 8),
          indicatorPadding: EdgeInsets.only(bottom: 12),
          unselectedLabelColor: AppColors.primaryGay,
          controller: _tabController,
          tabs: [
            Tab(
              text: localization.class_room,
            ),
            Tab(
              text: localization.course,
            )
          ],
        ),
      ),
      body: StreamBuilder<ClassResponse?>(
        stream: bloc.classResponsseStream,
        builder: (context, snapshot) {
          var data = snapshot.data;
          return TabBarView(
            controller: _tabController,
            children: [
              classTab(data),
              CourseTab(data?.course),
            ],
          );
        }
      ),
    );
  }

  Widget classTab(ClassResponse? data) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 14,
        left: 18,
        right: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 7.0,
              bottom: 10.0,
              left: 8.0,
            ),
            color: AppColors.primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.class_information,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 3),
                  child: InformationCard(
                    isList: false,
                    leading: localization.class_name,
                    trailing: data?.className??"",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.room,
                  trailing: data?.room??"",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.start_date,
                    trailing: data?.startDate,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.start_date,
                    trailing: data?.endDate,
                  ),
                ),
                InformationCard(
                  isList: true,
                  leading: localization.class_time,
                  listTrailing: data?.classTimes,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 9),
            padding: EdgeInsets.only(
              top: 7.0,
              bottom: 10.0,
              left: 8.0,
            ),
            color: AppColors.primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.class_detail,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 3),
                  child: InformationCard(
                    isList: false,
                    leading: localization.student,
                    trailing: "${data?.course?.max} (student)",
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        localization.lectures,
                        style: TextStyle(
                          color: AppColors.primaryBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          lectureList.length ?? 0,
                              (index) => Text(
                                lectureList[index],
                            style: TextStyle(
                              color: AppColors.primaryGay,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CourseTab(Course? course) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 14,
        left: 18,
        right: 18,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 7.0,
              bottom: 10.0,
              left: 8.0,
            ),
            color: AppColors.primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.course_information,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.course_name,
                    trailing: course?.courseName??"",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.fee,
                  trailing: course?.fee,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.max_students,
                    trailing: course?.max.toString(),
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.description,
                  trailing: course?.description,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            padding: EdgeInsets.only(
              top: 7.0,
              bottom: 10.0,
              left: 8.0,
            ),
            color: AppColors.primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.course_type,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.type_name,
                    trailing: course?.courseType?.typeName??"",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.description,
                  trailing: course?.courseType?.description??"",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            padding: EdgeInsets.only(
              top: 7.0,
              bottom: 10.0,
              left: 8.0,
            ),
            color: AppColors.primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.level,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.level_name,
                    trailing: course?.level?.levelName,
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.point,
                  trailing: course?.level?.point,
                ),
                SizedBox(
                  height: 5,
                ),
                InformationCard(
                  isList: false,
                  leading: localization.language,
                  trailing: course?.level?.language,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  CourseInformationBloc get bloc => widget.bloc;
}
