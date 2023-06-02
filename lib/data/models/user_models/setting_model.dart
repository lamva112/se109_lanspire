class SettingModel {
  bool? pushNotification;
  bool? emailNotification;

  SettingModel({this.pushNotification, this.emailNotification});

  SettingModel.fromJson(Map<String, dynamic> json) {
    pushNotification = json['pushNotification'];
    emailNotification = json['emailNotification'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pushNotification': pushNotification,
      'emailNotification': emailNotification,
    };
  }
}
