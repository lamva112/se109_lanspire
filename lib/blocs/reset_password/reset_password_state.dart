import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  final bool? success;
  final String? error;

  ResetPasswordState({
    ResetPasswordState? state,
    bool? success,
    String? error,
  })  : success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error];
}