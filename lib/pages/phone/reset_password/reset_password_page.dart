import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:se109_lanspire/blocs/auth/auth.dart';
import '../../../core/base/base_state.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';
import '../../../widgets/custom_textfield/custom_textfield.dart';
import '../../../widgets/ink_well_wrapper.dart';
import 'widget/count_down_resend.dart';

class ResetPassWordPage extends StatefulWidget {
  final AuthBloc bloc;
  const ResetPassWordPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<ResetPassWordPage> createState() => _ResetPassWordPageState();
}

class _ResetPassWordPageState extends BaseState<ResetPassWordPage,AuthBloc> {
  var codeController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var buttonStatus = BehaviorSubject.seeded(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                Assets.images.png.resetBackground.path,
              ),
            ),
          ),
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
                  margin: EdgeInsets.only(left: 27,right: 27,top: 54),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CountDownResend(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        textStyle: TextStyle(
                          color: AppColors.primaryBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        duration: Duration(seconds: 30),
                        title: "Resend",
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
                            localization.code,
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
                        onChanged: (value){
                          validate(value,passwordController.text,confirmPasswordController.text);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localization.code_can_not_be_empty;
                          }
                          return null;
                        },
                        textFieldType: TextFieldType.text,
                        decorationConfig: textFieldDecorationConfig(
                          prefixIcon: Assets.images.png.user.image(),
                          controller: codeController,
                          hint: localization.code,
                        ),
                        textFieldConfig: textFieldConfig(controller: codeController),
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
                            localization.new_password,
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
                        onChanged: (value){
                          validate(codeController.text,value,confirmPasswordController.text);
                        },
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return localization.password_must_be_at_least_8_charactor;
                          }
                          return null;
                        },
                        textFieldType: TextFieldType.password,
                        decorationConfig: textFieldDecorationConfig(
                          prefixIcon: Assets.images.png.clock.image(),
                          controller: passwordController,
                        ),
                        textFieldConfig: textFieldConfig(
                          controller: passwordController,
                        ),
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
                            localization.confirm_password,
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
                        onChanged: (value){
                          validate(value,passwordController.text,confirmPasswordController.text);
                        },
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return localization.password_must_be_at_least_8_charactor;
                          }
                          if(value != passwordController.text){
                            return localization.confirm_password_is_not_valid;
                          }
                          return null;
                        },
                        textFieldType: TextFieldType.password,
                        decorationConfig: textFieldDecorationConfig(
                          prefixIcon: Assets.images.png.clock.image(),
                          controller: confirmPasswordController,
                        ),
                        textFieldConfig: textFieldConfig(
                          controller: confirmPasswordController,
                        ),
                      ),
                      InkWellWrapper(
                        onTap: buttonStatus.value?(){}:null,
                        margin: EdgeInsets.only(top: 25,bottom: 46),
                        borderRadius: BorderRadius.circular(10),
                        color: buttonStatus.value?AppColors.primaryBlueBerry:AppColors.primaryBlueBerry.withOpacity(0.5),
                        paddingChild: EdgeInsets.symmetric(vertical: 14),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          localization.reset_password,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryWhite
                          ),
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
      {required TextEditingController controller, String? hint, Widget? suffixIcon, Widget? prefixIcon}) {
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
      disabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
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

  void validate(String code, String password, String confirmPassword){
    var value = (code.isNotEmpty && password.length > 7 && confirmPassword.length > 7 && password == confirmPassword);
    buttonStatus.add(value);
  }
  
  @override
  AuthBloc get bloc => widget.bloc;
}
