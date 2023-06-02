
import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';

class ExamSchedulePage extends StatefulWidget {
  final ExamScheduleBloc bloc;
  const ExamSchedulePage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<ExamSchedulePage> createState() => _ExamSchedulePageState();
}

class _ExamSchedulePageState extends BaseState<ExamSchedulePage,ExamScheduleBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  @override
  ExamScheduleBloc get bloc => widget.bloc;
}
