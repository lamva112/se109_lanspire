import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {
  final bool? success;
  final String? error;

  ForgetPasswordState({
    ForgetPasswordState? state,
    bool? success,
    String? error,
  })  : success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error];
}