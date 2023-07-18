import '../data.dart';

class StudentResponse {
  String? idStudent;
  String? idUser;
  bool? isDeleted;
  UserModel? user;

  List<Classes>? classes;
  List<Exams>? exams;

  StudentResponse({
    this.idStudent,
    this.idUser,
    this.isDeleted,
    this.user,
    this.classes,
    this.exams,
  });

  StudentResponse.fromJson(Map<String, dynamic> json) {
    idStudent = json['idStudent'];
    idUser = json['idUser'];
    isDeleted = json['isDeleted'];
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
    if (json['Classes'] != null) {
      classes = <Classes>[];
      json['Classes'].forEach((v) { classes!.add(Classes.fromJson(v)); });
    }
    if (json['Exams'] != null) {
      exams = <Exams>[];
      json['Exams'].forEach((v) { exams!.add(new Exams.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idStudent'] = this.idStudent;
    data['idUser'] = this.idUser;
    data['isDeleted'] = this.isDeleted;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    // if (this.classes != null) {
    //   data['Classes'] = this.classes!.map((v) => v.toJson()).toList();
    // }
    // if (this.exams != null) {
    //   data['Exams'] = this.exams!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
