class CourseType {
  String? idCourseType;
  String? typeName;
  String? description;
  bool? isDeleted;

  CourseType(
      {this.idCourseType, this.typeName, this.description, this.isDeleted});

  CourseType.fromJson(Map<String, dynamic> json) {
    idCourseType = json['idCourseType'];
    typeName = json['typeName'];
    description = json['description'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCourseType'] = this.idCourseType;
    data['typeName'] = this.typeName;
    data['description'] = this.description;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
