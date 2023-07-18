import 'package:flutter/material.dart';
import '../../../data/data.dart';
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
        child: StreamBuilder<List<Classes>?>(
            stream: bloc.classStream,
            builder: (context, snapshot) {
              var listClass = snapshot.data;
              return Column(
                children: [
                  ...List.generate(
                    listClass?.length ?? 0,
                    (index) => CourseCard(
                      classes: listClass?[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.courseInformation,
                          arguments: listClass?[index].idClass,
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  @override
  CourseBloc get bloc => widget.bloc;
}
