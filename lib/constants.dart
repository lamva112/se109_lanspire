// Global variables here
class AppConstants {}

class SharedPreferencesKey {
  static const String languageCode = 'languageCode';
  static const String token = 'token';
  static const String userPassedOnBoarding = 'passedOnBoarding';
  static const String searchingAddress = 'searchingAddress';
}

const List<String> fbPermissions = [
  'email',
  'public_profile',
  'openid',
];
const String fbFields = 'id,name,first_name,last_name,email,middle_name,name_format,picture.width(800).height(800),short_name';
