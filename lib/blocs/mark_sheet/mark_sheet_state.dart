import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class MarkSheetState extends Equatable {
  final bool? success;
  final String? error;
  final List<Exams>? exams;

  MarkSheetState({
    MarkSheetState? state,
    bool? success,
    String? error,
    List<Exams>? exams,
  })  : success = state?.success ?? success,
        error = state?.error ?? error,exams = state?.exams??exams;

  @override
  List<Object?> get props => [success, error,exams];
}
