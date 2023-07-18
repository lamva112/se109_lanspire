import 'package:equatable/equatable.dart';

import '../../data/data.dart';
import '../../data/responses/user_info_response.dart';
import '../../enums.dart';

class AuthState extends Equatable {
  final bool? success;
  final String? error;
  final AuthResponse? authResponse;
  final AuthType? authType;
  final UserInfoResponse? userInfoResponse;

  AuthState({
    AuthState? state,
    bool? success,
    String? error,
    AuthResponse? authResponse,
    AuthType? authType,
    UserModel? userModel,
    UserInfoResponse? userInfoResponse,
  })  : success = success ?? state?.success,
        error = error ?? state?.error,
        authResponse = authResponse ?? state?.authResponse,
        authType = authType ?? state?.authType,
        userInfoResponse = userInfoResponse ?? state?.userInfoResponse;

  @override
  List<Object?> get props => [success, error, authResponse, authType];
}
