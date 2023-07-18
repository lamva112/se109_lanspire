import 'package:flutter/material.dart';
import 'package:se109_lanspire/core/base/loading_widget.dart';
import 'package:se109_lanspire/widgets/ink_well_wrapper.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../data/data.dart';
import '../../../resources/resources.dart';

class MarkSheetPage extends StatefulWidget {
  final MarkSheetBloc bloc;

  const MarkSheetPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<MarkSheetPage> createState() => _MarkSheetPageState();
}

class _MarkSheetPageState extends BaseState<MarkSheetPage, MarkSheetBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlueBerry,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          localization.core,
          style: TextStyle(fontSize: 20, color: AppColors.primaryWhite, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 13, right: 13),
          child: StreamBuilder<List<Exams>?>(
              stream: bloc.examStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingWidget();
                }
                List<Exams>? exams = snapshot.data ?? [];
                Map<String, List<Exams>> groupedExams = {};
                for (var exam in exams) {
                  String idClass = exam.idClass ?? "";

                  if (groupedExams.containsKey(idClass)) {
                    groupedExams[idClass]?.add(exam);
                  } else {
                    groupedExams[idClass] = [exam];
                  }
                }

                return Column(
                  children: [
                    ...List.generate(
                      groupedExams.length,
                      (index) => Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 16),
                                  decoration: BoxDecoration(border: Border.all(color: AppColors.primaryBlack)),
                                  padding: EdgeInsets.only(top: 9, bottom: 5),
                                  child: Text(
                                    "${localization.class_room}:${groupedExams.values.elementAt(index)[index].classes?.className??""}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlueBerry,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: AppColors.primaryBlack),
                                        bottom: BorderSide(color: AppColors.primaryBlack),
                                        right: BorderSide(color: AppColors.primaryBlack),
                                      ),),
                                  padding: EdgeInsets.only(top: 9, bottom: 5),
                                  child: Text(
                                    localization.exam_name,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: AppColors.primaryBlack),
                                        bottom: BorderSide(color: AppColors.primaryBlack),
                                        right: BorderSide(color: AppColors.primaryBlack),
                                      )),
                                  padding: EdgeInsets.only(top: 9, bottom: 5),
                                  child: Text(
                                    localization.core,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...List.generate(
                            groupedExams.values.elementAt(index).length,
                            (i) => buildListGrade(groupedExams.values.elementAt(index)[i]),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }


  Widget buildListGrade(Exams? exam) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.primaryBlack),
                bottom: BorderSide(color: AppColors.primaryBlack),
                right: BorderSide(color: AppColors.primaryBlack),
              ),),
            padding: EdgeInsets.only(top: 9, bottom: 5),
            child: Text(
              exam?.examName??"",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.primaryBlack),
                  bottom: BorderSide(color: AppColors.primaryBlack),
                  right: BorderSide(color: AppColors.primaryBlack),
                )),
            padding: EdgeInsets.only(top: 9, bottom: 5),
            child: Text(
              exam?.testing?.score.toString()??"",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget ItemCard(String title) {
    return Container(
      padding: EdgeInsets.only(top: 9, bottom: 5),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: AppColors.primaryBlack),
        right: BorderSide(color: AppColors.primaryBlack),
      )),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryBlack,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  MarkSheetBloc get bloc => widget.bloc;
}
