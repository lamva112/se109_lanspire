import 'package:equatable/equatable.dart';

class CourseState extends Equatable {
  final bool? success;
  final String? error;

  CourseState({
    CourseState? state,
    bool? success,
    String? error,
  })  : success = state?.success ?? success,
        error = state?.error ?? error;

  @override
  List<Object?> get props => [success, error];
}
