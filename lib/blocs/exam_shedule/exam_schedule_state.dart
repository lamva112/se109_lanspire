import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class ExamScheduleState extends Equatable {
  final bool? success;
  final String? error;
  List<Exams>? exams;
  ExamScheduleState({
    ExamScheduleState? state,
    bool? success,
    String? error,
    List<Exams>? exams,
  })  : success = state?.success ?? success,
        error = state?.error ?? error, exams = state?.exams??exams;

  @override
  List<Object?> get props => [success, error,exams];
}
