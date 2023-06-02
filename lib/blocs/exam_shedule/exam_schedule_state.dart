import 'package:equatable/equatable.dart';

class ExamScheduleState extends Equatable {
  final bool? success;
  final String? error;

  ExamScheduleState({
    ExamScheduleState? state,
    bool? success,
    String? error,
  })  : success = state?.success ?? success,
        error = state?.error ?? error;

  @override
  List<Object?> get props => [success, error];
}
