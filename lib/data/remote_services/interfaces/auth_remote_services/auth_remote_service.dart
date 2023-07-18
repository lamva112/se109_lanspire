import '../../../data.dart';
import '../../../responses/user_info_response.dart';

abstract class IAuthRemoteService implements IFacebookAuthRemoteService, IGoogleAuthRemoteService {
  Future<void> signInWithPhoneNumber({required String phoneNumber});

  Future<void> signOut();

  Future<void> signUpWithPhoneNumber({required String phoneNumber});

  Future<void> forgotPassword({required String phoneNumber});

  Future<void> otpVerification({required String otp});

  Future<void> resetPassword({required String newPassword, required String confirmedPassword});

  AuthResponse get firebaseCurrentUser;

  Future<UserInfoResponse?> signInWithEmail({required String email, required String password});
}
