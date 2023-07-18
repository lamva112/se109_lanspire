import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class HomeState extends Equatable {
  final bool? success;
  final String? error;
  final StudentResponse? student;

  HomeState({
    HomeState? state,
    bool? success,
    String? error,
    StudentResponse? student
  })  : success = state?.success ?? success,
        error = state?.error ?? error,student = state?.student ?? student;

  @override
  List<Object?> get props => [success, error,student];
}
