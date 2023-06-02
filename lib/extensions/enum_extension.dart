import '../enums.dart';

extension EnvironmentExtension on Environment {
  String get value => ['dev', 'staging', 'prod'][index];
}

extension AuthErrorTypeExtension on AuthErrorType {
  String convertToMessage() {
    switch (this) {
      case AuthErrorType.invalidRequest:
        return 'invalid.request';
      case AuthErrorType.phoneAlreadyConfirmed:
        return 'phone.already.confirmed';
      case AuthErrorType.codeRequired:
        return 'code.required';
      case AuthErrorType.codeWrong:
        return 'code.wrong';
      case AuthErrorType.phoneRequired:
        return 'phone.required';
      case AuthErrorType.queryRequired:
        return 'query.required';
      case AuthErrorType.socialLoginFailed:
        return 'social.login.failed';
      case AuthErrorType.emailAlreadyTaken:
        return 'email.already.taken';
      case AuthErrorType.userNotExist:
        return 'user.not.exist';
      case AuthErrorType.userEmailExists:
        return 'user.email.exists';
      case AuthErrorType.userNotFound:
        return 'user.not.found';
      case AuthErrorType.emailInvalid:
        return 'email.invalid';
      case AuthErrorType.emailRequired:
        return 'email.required';
      case AuthErrorType.nameRequired:
        return 'name.required';
      case AuthErrorType.providerRequired:
        return 'provider.required';
      case AuthErrorType.providerInvalid:
        return 'provider.invalid';
      case AuthErrorType.phoneTaken:
        return 'phone.taken';
      case AuthErrorType.placeInvalid:
        return 'place.invalid';
      case AuthErrorType.usernameAlreadyTaken:
        return 'username.already.taken';
      case AuthErrorType.unknown:
        return 'unknown';
    }
  }
}

