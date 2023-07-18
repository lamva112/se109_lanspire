class Class {
  String? idClass;
  String? className;
  String? idCourse;
  String? room;
  String? startDate;
  String? endDate;
  bool? isDeleted;

  Class({this.idClass, this.className, this.idCourse, this.room, this.startDate, this.endDate, this.isDeleted});

  Class.fromJson(Map<String, dynamic> json) {
    idClass = json['idClass'];
    className = json['className'];
    idCourse = json['idCourse'];
    room = json['room'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idClass'] = this.idClass;
    data['className'] = this.className;
    data['idCourse'] = this.idCourse;
    data['room'] = this.room;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
