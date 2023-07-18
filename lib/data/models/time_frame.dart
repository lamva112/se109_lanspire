import 'package:se109_lanspire/data/models/class_times.dart';

class TimeFrames {
  String? idTimeFrame;
  String? startingTime;
  String? endingTime;
  bool? activate;
  ClassTime? classTime;

  TimeFrames({this.idTimeFrame,
    this.startingTime,
    this.endingTime,
    this.activate,
    this.classTime});

  TimeFrames.fromJson(Map<String, dynamic> json) {
    idTimeFrame = json['idTimeFrame'];
    startingTime = json['startingTime'];
    endingTime = json['endingTime'];
    activate = json['activate'];
    classTime = json['ClassTime'] != null
        ? new ClassTime.fromJson(json['ClassTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTimeFrame'] = this.idTimeFrame;
    data['startingTime'] = this.startingTime;
    data['endingTime'] = this.endingTime;
    data['activate'] = this.activate;
    if (this.classTime != null) {
      data['ClassTime'] = this.classTime!.toJson();
    }
    return data;
  }
}
