import 'package:get_it/get_it.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/blocs.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerLazySingleton(() => AppBloc());
    injector.registerFactory<SplashBloc>(() => SplashBloc(injector()));
    injector.registerFactory<HomeBloc>(() => HomeBloc());
    injector.registerFactory<CourseBloc>(() => CourseBloc());
    injector
        .registerFactory<CourseInformationBloc>(() => CourseInformationBloc());
    injector.registerFactory<ExamScheduleBloc>(() => ExamScheduleBloc());
    injector.registerFactory<AuthBloc>(
        () => AuthBloc(injector(), injector(), injector()));
  }
}
