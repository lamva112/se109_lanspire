import 'package:se109_lanspire/data/models/frame_time.dart';

class ClassTimes {
  String? idClassTime;
  String? idClass;
  int? dayOfWeek;
  String? idTimeFrame;
  TimeFrame? timeFrame;

  ClassTimes(
      {this.idClassTime,
        this.idClass,
        this.dayOfWeek,
        this.idTimeFrame,
        this.timeFrame});

  ClassTimes.fromJson(Map<String, dynamic> json) {
    idClassTime = json['idClassTime'];
    idClass = json['idClass'];
    dayOfWeek = json['dayOfWeek'];
    idTimeFrame = json['idTimeFrame'];
    timeFrame = json['TimeFrame'] != null
        ? new TimeFrame.fromJson(json['TimeFrame'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idClassTime'] = this.idClassTime;
    data['idClass'] = this.idClass;
    data['dayOfWeek'] = this.dayOfWeek;
    data['idTimeFrame'] = this.idTimeFrame;
    if (this.timeFrame != null) {
      data['TimeFrame'] = this.timeFrame!.toJson();
    }
    return data;
  }
}
