import 'package:get_it/get_it.dart';
import 'package:se109_lanspire/data/remote_services/class_detail_remote_service.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/class_detail_remote_service.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/home_remote_service.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/user_remote_service.dart';

import '../data/data.dart';
import '../data/remote_services/home_remote_service.dart';
import '../data/remote_services/user_remote_service.dart';

class RemoteServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ISplashRemoteService>(() => SplashRemoteService());
    injector.registerFactory<IAuthRemoteService>(() => AuthRemoteService());
    injector.registerFactory<IUserRemoteService>(() => UserRemoteService());
    injector.registerFactory<IHomeRemoteService>(() => HomeRemoteService());
    injector.registerFactory<IClassDetailRemoteService>(() => ClassDetailRemoteService());
  }
}
