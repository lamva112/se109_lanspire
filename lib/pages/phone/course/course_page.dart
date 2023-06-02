import 'package:flutter/material.dart';
import '../../../resources/colors.dart';
import '../../../core/base/base.dart';
import '../../../blocs/blocs.dart';
import '../../../router/router.dart';
import 'widget/course_card.dart';

class CoursePage extends StatefulWidget {
  final CourseBloc bloc;

  const CoursePage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends BaseState<CoursePage, CourseBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlueBerry,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          localization.class_roster,
          style: TextStyle(fontSize: 20, color: AppColors.primaryWhite, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              2,
              (index) => CourseCard(
                onTap: (){
                  Navigator.pushNamed(context, Routes.courseInformation);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CourseBloc get bloc => widget.bloc;
}
