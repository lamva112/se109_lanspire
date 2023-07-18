import 'package:equatable/equatable.dart';
import 'package:se109_lanspire/data/responses/class_detail_response.dart';

class CourseInformationState extends Equatable {
  final bool? success;
  final String? error;
  final ClassResponse? classResponse;
  CourseInformationState({
    CourseInformationState? state,
    bool? success,
    String? error,
    ClassResponse? classResponse,
  })  : success = state?.success ?? success,
        error = state?.error ?? error,classResponse = state?.classResponse ?? classResponse;

  @override
  List<Object?> get props => [success, error,classResponse];
}
