import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class TimeTableState extends Equatable {
  final bool? success;
  final String? error;
  final List<Classes>? classes;
  TimeTableState({
    TimeTableState? state,
    bool? success,
    String? error,
    List<Classes>? classes,
  })  : success = state?.success ?? success,
        error = state?.error ?? error,classes = state?.classes ?? classes;

  @override
  List<Object?> get props => [success, error,classes];
}
