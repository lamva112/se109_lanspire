import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../constants.dart';
import '../../../data.dart';
import '../../../responses/auth_response.dart';

abstract class IFacebookAuthRemoteService {
  Future<AuthResponse> signInWithFacebook({
    List<String> permissions = fbPermissions,
    LoginBehavior loginBehavior = LoginBehavior.nativeWithFallback,
  });

  Future<AuthResponse> get getCurrentFacebookToken;

  Future<AuthResponse> get isUserSignedInWithFacebook;

  Future<void> signOutFacebookAccount();

  Future<AuthResponse> getFacebookUserData({String fields = fbFields});
}
