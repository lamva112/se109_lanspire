import 'package:flutter/material.dart';
import 'package:se109_lanspire/pages/phone/exam_chedule/widget/exam_card.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../data/data.dart';
import '../../../resources/resources.dart';

class ExamSchedulePage extends StatefulWidget {
  final ExamScheduleBloc bloc;
  const ExamSchedulePage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<ExamSchedulePage> createState() => _ExamSchedulePageState();
}

class _ExamSchedulePageState
    extends BaseState<ExamSchedulePage, ExamScheduleBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlueBerry,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          localization.exam_schedule,
          style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryWhite,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Exams>?>(
          stream: bloc.examStream,
          builder: (context, snapshot) {
            var exam = snapshot.data;
              exam?.sort((a, b) => a.dateTest!.compareTo(b.dateTest!));

            return Column(
              children: [
                ...List.generate(
                  exam?.length??0,
                  (index) => ExamCard(
                    onTap: (){

                    },
                    exam: exam?[index],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  @override
  ExamScheduleBloc get bloc => widget.bloc;
}
