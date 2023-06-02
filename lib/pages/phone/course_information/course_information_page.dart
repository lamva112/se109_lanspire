import 'package:flutter/material.dart';
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
  List<String> classTime = [
    "14:00 - 17:00 | Tue",
    "14:00 - 17:00 | Tue",
    "14:00 - 17:00 | Tue",
    "14:00 - 17:00 | Tue",
  ];

  List<String> lectureList = ["Tran Van A", "Tran Van A", "Tran Van A", "Tran Van A"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          icon: Icon(Icons.arrow_back_ios_new,color: AppColors.primaryBlack,),
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
      body: TabBarView(
        controller: _tabController,
        children: [classTab(), CourseTab()],
      ),
    );
  }

  Widget classTab() {
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
                    trailing: "TOEIC 650",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.room,
                  trailing: "Room 69",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.start_date,
                    trailing: "29-11-2021",
                  ),
                ),
                InformationCard(
                  isList: true,
                  leading: localization.class_time,
                  listTrailing: classTime,
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
                    trailing: "18 (student)",
                  ),
                ),
                InformationCard(
                  isList: true,
                  leading: localization.lectures,
                  listTrailing: lectureList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CourseTab() {
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
                    trailing: "TOEIC 650",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.fee,
                  trailing: "6.000.000",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InformationCard(
                    isList: false,
                    leading: localization.max_students,
                    trailing: "20",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.description,
                  trailing: "Desciprtion TOEIC 500",
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
                    trailing: "TOEIC",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.description,
                  trailing: "Desciption about TOEIC",
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
                    trailing: "Pro",
                  ),
                ),
                InformationCard(
                  isList: false,
                  leading: localization.point,
                  trailing: "500",
                ),
                SizedBox(
                  height: 5,
                ),
                InformationCard(
                  isList: false,
                  leading: localization.language,
                  trailing: "English",
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
