import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:se109_lanspire/blocs/auth/auth.dart';
import 'package:se109_lanspire/core/base/base.dart';
import 'package:se109_lanspire/gen/assets.gen.dart';
import 'package:se109_lanspire/resources/resources.dart';
import 'package:se109_lanspire/widgets/ink_well_wrapper.dart';

import '../../../router/router.dart';
import '../../../widgets/custom_textfield/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  final AuthBloc bloc;

  const SignInPage({super.key, required this.bloc});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BaseState<SignInPage, AuthBloc> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var buttonStatus = BehaviorSubject.seeded(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox.expand(
              child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              Assets.images.png.background.path,
            ),
          )),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 52, bottom: 15),
                  child: Assets.images.png.logo.image(fit: BoxFit.cover),
                ),
                Text(
                  localization.well_come_to_lanspire,
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 19),
                  margin: EdgeInsets.only(left: 27, right: 27, top: 54),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            '*',
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            localization.user_name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryBlack,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        onChanged: (value) {
                          buttonStatus.add(value.isNotEmpty && passwordController.text.length > 7);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localization.user_name_is_not_valid;
                          }
                          return null;
                        },
                        textFieldType: TextFieldType.text,
                        decorationConfig: textFieldDecorationConfig(
                          prefixIcon: Assets.images.png.user.image(),
                          controller: userNameController,
                          hint: localization.user_name,
                        ),
                        textFieldConfig:
                            textFieldConfig(controller: userNameController),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Text(
                            '*',
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            localization.password,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryBlack,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        onChanged: (value) {
                          buttonStatus.add(value.length > 8 && userNameController.text.isNotEmpty);
                        },
                        validator: (value) {
                          if (value!.length < 8) {
                            return localization.password_must_be_at_least_8_charactor;
                          }
                          return null;
                        },
                        textFieldType: TextFieldType.password,
                        decorationConfig: textFieldDecorationConfig(
                          prefixIcon: Assets.images.png.user.image(),
                          controller: passwordController,
                          hint: localization.password,
                        ),
                        textFieldConfig: textFieldConfig(
                          controller: passwordController,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWellWrapper(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.forgetPassword);
                          },
                          paddingChild: EdgeInsets.all(4),
                          child: Text(
                            localization.forgot_password,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryBlueBall,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      InkWellWrapper(
                        onTap: buttonStatus.value?() {
                          Navigator.pushNamed(context, Routes.home);
                        }:null,
                        margin: EdgeInsets.only(top: 25, bottom: 46),
                        borderRadius: BorderRadius.circular(10),
                        color: buttonStatus.value
                            ? AppColors.primaryBlueBerry
                            : AppColors.primaryBlueBerry.withOpacity(0.5),
                        paddingChild: EdgeInsets.symmetric(vertical: 14),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          localization.sign_in,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryWhite),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFieldDecorationConfig textFieldDecorationConfig(
      {required TextEditingController controller,
      required String hint,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return TextFieldDecorationConfig(
      contentPadding: EdgeInsets.all(16),
      fillColor: AppColors.primaryWhite,
      filled: true,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack.withOpacity(0.4),
        fontFamily: 'Poppins',
      ),
      errorStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
        color: AppColors.primaryBlack,
        fontFamily: 'Poppins',
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryRed),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryRed),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    );
  }

  TextFieldConfig textFieldConfig({required TextEditingController controller}) {
    return TextFieldConfig(
      validatorMode: AutovalidateMode.onUserInteraction,
      enableSuggestions: false,
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primaryBlack,
          ),
      cursorColor: AppColors.primaryBlack,
    );
  }

  @override
  AuthBloc get bloc => widget.bloc;
}
