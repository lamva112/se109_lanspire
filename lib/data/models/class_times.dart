class ClassTime {
  String? idClassTime;
  String? idClass;
  int? dayOfWeek;
  String? idTimeFrame;

  ClassTime({this.idClassTime, this.idClass, this.dayOfWeek, this.idTimeFrame});

  ClassTime.fromJson(Map<String, dynamic> json) {
    idClassTime = json['idClassTime'];
    idClass = json['idClass'];
    dayOfWeek = json['dayOfWeek'];
    idTimeFrame = json['idTimeFrame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idClassTime'] = this.idClassTime;
    data['idClass'] = this.idClass;
    data['dayOfWeek'] = this.dayOfWeek;
    data['idTimeFrame'] = this.idTimeFrame;
    return data;
  }
}
