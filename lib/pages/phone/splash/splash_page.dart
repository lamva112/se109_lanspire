import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../blocs/blocs.dart';
import '../../../constants.dart';
import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../router/router.dart';

class SplashPage extends StatefulWidget {
  final SplashBloc bloc;

  SplashPage(this.bloc);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  @override
  SplashBloc get bloc => widget.bloc;

  @override
  void initData() {
    super.initData();
    bloc.loadData().then((value) {
      Navigator.pushNamed(context, Routes.signIn);
    });
  }

  // override this function to get data from previous page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlueBerry,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.png.logo.image(fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}
