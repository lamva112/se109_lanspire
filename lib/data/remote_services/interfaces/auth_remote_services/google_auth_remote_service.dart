import '../../../responses/auth_response.dart';

abstract class IGoogleAuthRemoteService {
  Future<AuthResponse> signInWithGoogle();

  Future<AuthResponse> signOutGoogleAccount();

  AuthResponse get getCurrentGoogleAccount;

  Future<AuthResponse> get isUserSignedInWithGoogle;

  Future<AuthResponse> signInWithGoogleSilently({
    bool suppressErrors = true,
    bool reAuthenticate = false,
  });
}
