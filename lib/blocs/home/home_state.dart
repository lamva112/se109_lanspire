import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool? success;
  final String? error;

  HomeState({
    HomeState? state,
    bool? success,
    String? error,
  })  : success = state?.success ?? success,
        error = state?.error ?? error;

  @override
  List<Object?> get props => [success, error];
}
