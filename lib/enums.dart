
enum Language { ko, en }

enum Environment { dev, staging, prod }

extension LanguageExt on Language {
  String get code => ['ko', 'en'][index];
}

enum CourseStatus {
  in_process,
  finish,
}

enum AuthErrorType {
  invalidRequest,
  phoneAlreadyConfirmed,
  codeRequired,
  codeWrong,
  phoneRequired,
  queryRequired,
  socialLoginFailed,
  emailAlreadyTaken,
  userNotExist,
  userEmailExists,
  userNotFound,
  emailInvalid,
  emailRequired,
  nameRequired,
  providerRequired,
  providerInvalid,
  phoneTaken,
  placeInvalid,
  usernameAlreadyTaken,
  unknown,
}

enum ImageType { network, file }

enum Gender { male, female, other }

enum AuthType { apple, facebook, google, phone }