import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../pages/pages.dart';
import '../router/router.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => SplashPage(injector()), instanceName: Routes.splash);
    injector.registerFactory<Widget>(() => SignInPage(bloc: injector(),), instanceName: Routes.signIn);
    injector.registerFactory<Widget>(() => ForgetPasswordPage(bloc: injector(),), instanceName: Routes.forgetPassword);
    injector.registerFactory<Widget>(() => ResetPassWordPage(bloc: injector(),), instanceName: Routes.resetPassword);
    injector.registerFactory<Widget>(() => HomePage(bloc: injector(),courseBloc: injector(),examScheduleBloc: injector(),userInformationBloc:injector(),timeTableBloc: injector(),markSheetBloc: injector(),), instanceName: Routes.home);
    injector.registerFactory<Widget>(() => CoursePage(bloc: injector(),), instanceName: Routes.course);
    injector.registerFactory<Widget>(() => CourseInformationPage(bloc: injector(),), instanceName: Routes.courseInformation);
    injector.registerFactory<Widget>(() => ExamSchedulePage(bloc: injector(),), instanceName: Routes.examSchedule);
    injector.registerFactory<Widget>(() => TimeTablePage(bloc: injector(),), instanceName: Routes.timeTable);
    injector.registerFactory<Widget>(() => MarkSheetPage(bloc: injector(),), instanceName: Routes.markSheet);
  }
}
