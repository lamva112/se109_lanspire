import 'package:equatable/equatable.dart';

class CourseInformationState extends Equatable {
  final bool? success;
  final String? error;

  CourseInformationState({
    CourseInformationState? state,
    bool? success,
    String? error,
  })  : success = state?.success ?? success,
        error = state?.error ?? error;

  @override
  List<Object?> get props => [success, error];
}
