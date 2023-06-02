import 'package:get_it/get_it.dart';

import '../data/data.dart';
import '../data/local_services/interfaces/shared_preferences_service.dart';
import '../data/local_services/shared_preferences_service.dart';

class LocalServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ISplashLocalService>(() => SplashLocalService());
    injector.registerFactory<ISharedPreferencesService>(
        () => SharedPreferencesService(sharedPreferences: injector()));
  }
}
