import 'package:se109_lanspire/data/local_services/interfaces/shared_preferences_service.dart';

import '../data.dart';

class SharedPreferencesRepository implements ISharedPreferencesRepository {
  final ISharedPreferencesService sharedPreferencesService;

  SharedPreferencesRepository(this.sharedPreferencesService);

  @override
  Future<bool> changeLanguage(String languageCode) {
    return sharedPreferencesService.changeLanguage(languageCode);
  }

  @override
  String? getLanguage() {
    return sharedPreferencesService.getLanguage();
  }

  @override
  String? getToken() {
    return sharedPreferencesService.getToken();
  }

  @override
  Future<bool> changeToken(String token) {
    return sharedPreferencesService.changeToken(token);
  }

  @override
  Future<bool> removeToken() {
    return sharedPreferencesService.removeToken();
  }

  @override
  Future<bool> setUserPassedOnBoardingPage(bool value) {
    return sharedPreferencesService.setUserPassedOnBoarding(value);
  }

  @override
  bool? checkIsUserPassedOnBoarding() {
    return sharedPreferencesService.checkIsUserPassedOnBoarding();
  }
}
