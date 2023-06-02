import 'package:equatable/equatable.dart';

import '../../data/data.dart';
import '../../enums.dart';

class AuthState extends Equatable {
  final bool? success;
  final String? error;
  final AuthResponse? authResponse;
  final AuthType? authType;

  AuthState({
    AuthState? state,
    bool? success,
    String? error,
    AuthResponse? authResponse,
    AuthType? authType,
    UserModel? userModel,
  })  : success = success ?? state?.success,
        error = error ?? state?.error,
        authResponse = authResponse ?? state?.authResponse,
        authType = authType ?? state?.authType;

  @override
  List<Object?> get props => [success, error, authResponse, authType];
}
