import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class UserInformationState extends Equatable {
  final bool? success;
  final String? error;
  final File? imageFile;
  final bool? isImageChanged;
  final UserModel? user;

  UserInformationState({
    UserInformationState? state,
    File? imageFile,
    bool? isImageChanged,
    bool? success,
    String? error,
    UserModel? user,
  })  : success = success ?? state?.success,
        error = error ?? state?.error,
        imageFile = imageFile ?? state?.imageFile,
        isImageChanged = isImageChanged ?? state?.isImageChanged,user = user ?? state?.user;

  @override
  List<Object?> get props => [success, error,user];
}