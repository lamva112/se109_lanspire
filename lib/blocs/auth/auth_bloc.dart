import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../constants.dart';
import '../../core/core.dart';
import '../../data/data.dart';
import '../../data/repositories/interfaces/user_repository.dart';
import '../../enums.dart';
import 'auth_state.dart';

final StreamController<AuthResponse?> authResController = StreamController<AuthResponse?>.broadcast();

class AuthBloc extends BaseBloc<AuthState> {
  final IAuthRepository authRepository;
  final ISharedPreferencesRepository sharedPreferencesRepo;
  final IUserRepository userRepository;

  AuthBloc(this.authRepository, this.sharedPreferencesRepo, this.userRepository);

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<AuthResponse?> get authResponseStream => stateStream.map((event) => event.authResponse);

  Stream<AuthType?> get authTypeStream => stateStream.map((event) => event.authType);

  /// Check if user signed in
  void checkIsUserSignedIn() async {
    /// TODO: reverse when having real data
    var token = (await sharedPreferencesRepo.getToken()) ?? '';
    var isSignedInWithFb = await isUserSignedInWithFacebook;
    var isSignedInWithGoogle = await isUserSignedInWithGoogle;

    if (token != null) {
      emit(AuthState(state: state, authResponse: AuthResponse(isUserSignedInWithPhone: true)));
    } else if (isSignedInWithFb) {
      emit(AuthState(state: state, authResponse: AuthResponse(isUserSignedInWithFacebook: true)));
    } else if (isSignedInWithGoogle) {
      emit(AuthState(state: state, authResponse: AuthResponse(isUserSignedInWithGoogle: true)));
    } else {
      emit(AuthState(
        state: state,
        authResponse: AuthResponse(
          isUserSignedInWithPhone: false,
          isUserSignedInWithGoogle: false,
          isUserSignedInWithFacebook: false,
        ),
      ));
    }
  }

  void getSignedInUserData({
    bool signedInWithPhone = false,
    bool signedInWithFb = false,
    bool signedInWithGoogle = false,
  }) async {
    if (signedInWithPhone) {
      var res = await userRepository.getUserInfo();

      res.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
      }, (data) {
        emit(AuthState(state: state, authResponse: AuthResponse(user: data?.user)));
      });
    } else if (signedInWithFb) {
      getFacebookUserData();
    } else if (signedInWithGoogle) {
      await getCurrentGoogleAccount;
    }
  }

  /// Auth handler methods
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    emitLoading(true);
    authRepository.signUpWithPhoneNumber(phoneNumber: phoneNumber).then((value) {
      value.fold(
        (failure) {
          emit(AuthState(state: state, error: failure.toString()));
        },
        (data) {},
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  Future<void> signOut() async {
    emitLoading(true);
    return authRepository.signOut().then((value) {
      value.fold(
        (failure) {
          emit(AuthState(state: state, error: failure.toString()));
        },
        (data) {
          /// TODO: reverse when having data
          emit(
            AuthState(
              state: state,
              authResponse: AuthResponse(
                isUserSignedInWithPhone: false,
                isUserSignedInWithFacebook: false,
                isUserSignedInWithGoogle: false,
              ),
            ),
          );
        },
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() async {
      emitLoading(false);
    });
  }

  Future<void> forgotPassword({required String phoneNumber}) async {
    emitLoading(true);
    authRepository.forgotPassword(phoneNumber: phoneNumber).then((value) {
      value.fold(
            (failure) {
          emit(AuthState(state: state, error: failure.toString()));
        },
        (data) {},
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  Future<void> otpVerification({required String otp}) async {
    emitLoading(true);
    authRepository.otpVerification(otp: otp).then((value) {
      value.fold(
            (failure) {
          emit(AuthState(state: state, error: failure.toString()));
        },
        (data) {},
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  Future<void> resetPassword({required String newPassword, required String confirmedPassword}) async {
    emitLoading(true);
    authRepository
        .resetPassword(
      newPassword: newPassword,
      confirmedPassword: confirmedPassword,
    )
        .then((value) {
      value.fold(
            (failure) {
          emit(AuthState(state: state, error: failure.toString()));
        },
        (data) {},
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  Future<void> signUpWithPhoneNumber({required String phoneNumber}) async {
    emitLoading(true);
    authRepository.signUpWithPhoneNumber(phoneNumber: phoneNumber).then((value) {
      value.fold(
            (failure) {
          emit(AuthState(state: state, error: failure.toString()));
        },
        (data) {},
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  /// Facebook handler methods
  Future<bool> get isUserSignedInWithFacebook async {
    return authRepository.isUserSignedInWithFacebook.then((value) {
      return value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
        return false;
      }, (data) {
        return data?.isUserSignedInWithFacebook ?? false;
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err.toString()));
    });
  }

  void getFacebookUserData({String fields = fbFields}) {
    emitLoading(true);
    authRepository.getFacebookUserData(fields: fields).then((value) {
      value.fold(
            (failure) => emit(
          AuthState(
            state: state,
            error: failure.toString(),
          ),
        ),
            (data) => emit(
          AuthState(state: state, authResponse: data),
        ),
      );
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  void signOutFacebookAccount() {
    emitLoading(true);
    authRepository.signOutFacebookAccount().then((value) {
      emit(AuthState(state: state, success: true));
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  void signInWithFacebook({
    List<String> permissions = fbPermissions,
    LoginBehavior loginBehavior = LoginBehavior.nativeWithFallback,
  }) {
    emitLoading(true);
    emit(AuthState(state: state, authType: AuthType.facebook));
    authRepository.signInWithFacebook(permissions: permissions, loginBehavior: loginBehavior).then((value) {
      value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
      }, (data) {
        authResController.add(data);
        emit(AuthState(state: state, authResponse: data));
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  Future<AccessToken?> get getCurrentFacebookToken async {
    return authRepository.getCurrentFacebookToken.then((value) {
      return value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
        return null;
      }, (data) {
        emit(AuthState(state: state, authResponse: data));
        return data?.facebookToken;
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    });
  }

  /// Google handler methods
  void signInWithGoogle() {
    emitLoading(true);
    emit(AuthState(state: state, authType: AuthType.google));
    authRepository.signInWithGoogle().then((value) {
      value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
      }, (data) {
        authResController.add(data);
        emit(AuthState(state: state, authResponse: data));
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  void signOutGoogleAccount() {
    emitLoading(true);
    authRepository.signOutGoogleAccount().then((value) {
      value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
      }, (data) {
        emit(AuthState(state: state, authResponse: data));
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  Future<User?> get getCurrentGoogleAccount {
    return authRepository.getCurrentGoogleAccount.then((value) {
      return value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
        return null;
      }, (data) {
        emit(AuthState(state: state, authResponse: data));
        return data?.googleAccount;
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    });
  }

  Future<bool> get isUserSignedInWithGoogle async {
    return authRepository.isUserSignedInWithGoogle.then((value) {
      return value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
        return false;
      }, (data) {
        emit(AuthState(state: state, authResponse: data));
        return data?.isUserSignedInWithGoogle ?? false;
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    });
  }

  void signInWithGoogleSilently({
    bool suppressErrors = true,
    bool reAuthenticate = false,
  }) {
    emitLoading(true);
    authRepository
        .signInWithGoogleSilently(
      suppressErrors: suppressErrors,
      reAuthenticate: reAuthenticate,
    )
        .then((value) {
      value.fold((failure) {
        emit(AuthState(state: state, error: failure.toString()));
      }, (data) {
        emit(AuthState(state: state, authResponse: data));
      });
    }).catchError((err) {
      emit(AuthState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  AuthResponse? get firebaseCurrentUser => authRepository.firebaseCurrentUser;

  @override
  void dispose() {
    super.dispose();
  }
}
