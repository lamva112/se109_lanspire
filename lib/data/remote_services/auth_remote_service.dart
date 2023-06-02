import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants.dart';
import '../data.dart';

class AuthRemoteService implements IAuthRemoteService {
  FacebookAuth get _fbInstance => FacebookAuth.instance;
  GoogleSignIn _googleInstance = GoogleSignIn();

  /// Auth handler methods
  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {}

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await signOutFacebookAccount();
    await signOutGoogleAccount();
  }

  @override
  Future<void> forgotPassword({required String phoneNumber}) async {}

  @override
  Future<void> otpVerification({required String otp}) async {}

  @override
  Future<void> resetPassword({required String newPassword, required String confirmedPassword}) async {}

  @override
  Future<void> signUpWithPhoneNumber({required String phoneNumber}) async {}

  /// Facebook handler methods
  @override
  Future<AuthResponse> get isUserSignedInWithFacebook async {
    var response = await getCurrentFacebookToken;
    return AuthResponse(isUserSignedInWithFacebook: response.facebookToken != null);
  }

  @override
  Future<AuthResponse> getFacebookUserData({String fields = fbFields}) async {
    var data = await _fbInstance.getUserData(fields: fields);
    return AuthResponse(facebookUserData: data);
  }

  @override
  Future<void> signOutFacebookAccount() async {
    await FirebaseAuth.instance.signOut();
    return _fbInstance.logOut();
  }

  @override
  Future<AuthResponse> signInWithFacebook({
    List<String> permissions = fbPermissions,
    LoginBehavior loginBehavior = LoginBehavior.nativeWithFallback,
  }) async {
    var res = await _fbInstance.login(permissions: permissions, loginBehavior: loginBehavior);

    if (res.accessToken != null) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(res.accessToken!.token);

      // Once signed in, return the UserCredential
      var userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      return AuthResponse(facebookSignInResult: userCredential.user);
    }

    return AuthResponse(facebookSignInResult: null);
  }

  @override
  Future<AuthResponse> get getCurrentFacebookToken async => AuthResponse(facebookToken: await _fbInstance.accessToken);

  /// Google handler methods
  @override
  Future<AuthResponse> signInWithGoogle() async {
    var account = await _googleInstance.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await account?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return AuthResponse(googleAccount: userCredential.user);
  }

  @override
  Future<AuthResponse> signOutGoogleAccount() async {
    // var account = await _googleInstance.signOut();
    await FirebaseAuth.instance.signOut();
    return AuthResponse(googleAccount: null);
  }

  @override
  AuthResponse get getCurrentGoogleAccount => AuthResponse(googleAccount: FirebaseAuth.instance.currentUser);

  @override
  Future<AuthResponse> get isUserSignedInWithGoogle async => AuthResponse(
    isUserSignedInWithGoogle: FirebaseAuth.instance.currentUser != null,
      );

  @override
  Future<AuthResponse> signInWithGoogleSilently({
    bool suppressErrors = true,
    bool reAuthenticate = false,
  }) async {
    var account = await _googleInstance.signInSilently(
      suppressErrors: suppressErrors,
      reAuthenticate: reAuthenticate,
    );

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await account?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return AuthResponse(googleAccount: userCredential.user);
  }

  @override
  AuthResponse get firebaseCurrentUser => AuthResponse(firebaseUser: FirebaseAuth.instance.currentUser);
}
