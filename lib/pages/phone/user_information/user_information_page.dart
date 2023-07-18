import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../core/base/loading_widget.dart';
import '../../../data/data.dart';
import '../../../widgets/ink_well_wrapper.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';
import '../../../widgets/custom_textfield/custom_textfield.dart';
import 'widget/date_inpur_formatter.dart';

class UserInformationPage extends StatefulWidget {
  final UserInformationBloc bloc;

  const UserInformationPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends BaseState<UserInformationPage, UserInformationBloc> {
  var _birthdayEditingController = TextEditingController();
  var _phoneEditingController = TextEditingController();
  var _emailEditingController = TextEditingController();
  var _locationEditingController = TextEditingController();
  var _provinceEditingController = TextEditingController();
  var _districtEditingController = TextEditingController();
  String birthday = "";
  String phone = "";
  String email = "";
  String location = "";
  String province = "";
  String district = "";

  @override
  void initState() {
    bloc.getStudentData(userId: "");
    super.initState();
  }

  @override
  void initData() {
    birthday = _birthdayEditingController.text;
    phone = _phoneEditingController.text;
    email = _emailEditingController.text;
    location = _locationEditingController.text;
    province = _provinceEditingController.text;
    district = _districtEditingController.text;
    super.initData();
  }

  var buttonStatus = BehaviorSubject.seeded(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlueBerry,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          localization.personal_information,
          style: TextStyle(fontSize: 20, color: AppColors.primaryWhite, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<UserModel?>(
            stream: bloc.userStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LoadingWidget();
              }
              var user = snapshot.data;
              _phoneEditingController.text = user?.phoneNumber ?? "";
              _emailEditingController.text = user?.email ?? "";
              _locationEditingController.text = user?.address?.join(', ') ?? "";
              _birthdayEditingController.text = user?.dob ?? "";
              List<TextEditingController> controllers = List.generate(
                user?.address?.length ?? 0,
                (index) => TextEditingController(),
              );
              controllers.asMap().forEach((key, value) {
                value.text = user?.address?[key] ?? "";
              });
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        avatarView(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCJj8ZYkQAM7tca17i8SGczxppRZ_20CqGaw&usqp=CAU"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.displayName ?? "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryInternationalOrange,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              getGender(user?.gender),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryGradientLight,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      checkInformationChange();
                    },
                    textFieldType: TextFieldType.text,
                    decorationConfig: textFieldDecorationConfig(
                      controller: _phoneEditingController,
                      prefixIcon: IconButton(
                        onPressed: null,
                        icon: Assets.images.png.phoneNumber.image(),
                      ),
                    ),
                    textFieldConfig: textFieldConfig(controller: _phoneEditingController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                      onChanged: (value) {
                        checkInformationChange();
                      },
                      textFieldType: TextFieldType.text,
                      decorationConfig: textFieldDecorationConfig(
                        controller: _emailEditingController,
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: Assets.images.png.email.image(),
                        ),
                      ),
                      textFieldConfig: textFieldConfig(controller: _emailEditingController),
                    ),
                  ),
                  CustomTextField(
                    inputFormatters: [DateTextInputFormatter()],
                    onChanged: (value) {
                      checkInformationChange();
                    },
                    textFieldType: TextFieldType.number,
                    decorationConfig: textFieldDecorationConfig(
                      controller: _birthdayEditingController,
                      prefixIcon: IconButton(
                        onPressed: null,
                        icon: Assets.images.png.birthDay.image(),
                      ),
                    ),
                    textFieldConfig: textFieldConfig(controller: _birthdayEditingController),
                  ),
                  ...List.generate(
                    controllers.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CustomTextField(
                        onChanged: (value) {
                          checkInformationChange();
                        },
                        textFieldType: TextFieldType.text,
                        decorationConfig: textFieldDecorationConfig(
                          controller: controllers[index],
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: Assets.images.png.province.image(),
                          ),
                        ),
                        textFieldConfig: textFieldConfig(controller: controllers[index]),
                      ),
                    ),
                  ),
                  StreamBuilder<bool>(
                      stream: buttonStatus,
                      builder: (context, snapshot) {
                        return InkWellWrapper(
                          onTap: () {
                            UserModel? newUser = user?.copyWith(
                              phoneNumber: _phoneEditingController.text,
                              dob: _birthdayEditingController.text,
                              email: _emailEditingController.text,
                              address: List.generate(controllers.length, (index) => controllers[index].text)
                            );
                            print(newUser?.toJson());
                          },
                          borderRadius: BorderRadius.circular(10),
                          margin: EdgeInsets.symmetric(horizontal: 41, vertical: 19),
                          color: buttonStatus.value ? AppColors.primaryBlueBerry : AppColors.primaryBlueBerry.withOpacity(0.5),
                          paddingChild: EdgeInsets.symmetric(vertical: 14),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            localization.update,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.primaryWhite),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }),
                ],
              );
            }),
      ),
    );
  }

  Widget avatarView({required String image}) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () => onAvatarClick(),
                child: StreamBuilder<File?>(
                  stream: bloc.imageFileStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Image.file(
                        snapshot.data!,
                        height: 124,
                        width: 124,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, stacktrace) {
                          return Container(height: 120, width: 120);
                        },
                      );
                    } else {
                      return Image.network(
                        image,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, event) {
                          if (event == null) return child;
                          return Container(height: 120, width: 120);
                        },
                        errorBuilder: (context, object, stacktrace) {
                          return Container(height: 120, width: 120);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () => onAvatarClick(),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryWhite,
                ),
                padding: EdgeInsets.all(8),
                child: Assets.images.png.pencil.image(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onAvatarClick() async {
    //bool isGranted = await PermissionHelper().checkPermission(Permission.storage);

    //if (isGranted) {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.isNotEmpty && result.files.single.path != null) {
      bloc.setAvatar(result.files.single.path!);
    }
    //}
  }

  TextFieldDecorationConfig textFieldDecorationConfig({required TextEditingController controller, Widget? prefixIcon}) {
    return TextFieldDecorationConfig(
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      fillColor: AppColors.primaryWhite,
      filled: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack),
        borderRadius: BorderRadius.circular(5),
      ),
      prefixIcon: prefixIcon,
    );
  }

  TextFieldConfig textFieldConfig({required TextEditingController controller}) {
    return TextFieldConfig(
      validatorMode: AutovalidateMode.onUserInteraction,
      enableSuggestions: false,
      controller: controller,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlueBerry,
      ),
      cursorColor: AppColors.primaryBlueBall,
    );
  }

  void checkInformationChange() {
    bool value = _phoneEditingController.text != phone ||
        _emailEditingController.text != email ||
        _birthdayEditingController.text != birthday ||
        _locationEditingController.text != location ||
        _provinceEditingController.text != province ||
        _districtEditingController.text != district ||
        _locationEditingController.text != location;

    buttonStatus.add(value);
  }

  String getGender(int? index) {
    switch (index) {
      case 0:
        return "Nam";
      case 1:
        return "Nữ";
      default:
        return "Nam";
    }
  }

  @override
  UserInformationBloc get bloc => widget.bloc;
}
