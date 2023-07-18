import 'package:get_it/get_it.dart';
import 'package:se109_lanspire/data/repositories/class_detail_repository.dart';

import '../data/data.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/home_respository.dart';
import '../data/repositories/interfaces/user_repository.dart';
import '../data/repositories/shared_preferences_repository.dart';
import '../data/repositories/user_repository.dart';

class RepositoryDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ISplashRepository>(() => SplashRepository(
          remoteService: injector(),
          localService: injector(),
          networkInfo: injector(),
        ));
    injector.registerFactory<IUserRepository>(
      () => UserRepository(
        userService: injector(),
        networkInfo: injector(),
      ),
    );
    injector.registerFactory<IAuthRepository>(
      () => AuthRepository(
        networkInfo: injector(),
        authRemoteService: injector(),
      ),
    );
    injector.registerFactory<ISharedPreferencesRepository>(
        () => SharedPreferencesRepository(injector()));
    injector.registerFactory<IHomeRepository>(
            () => HomeRepository(remoteService: injector(),networkInfo: injector(),));
    injector.registerFactory<IClassDetailRepository>(
            () => ClassDetailRepository(remoteService: injector(),networkInfo: injector(),));
  }
}
