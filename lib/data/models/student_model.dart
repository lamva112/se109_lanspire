import '../data.dart';

class Students {
  String? idStudent;
  String? idUser;
  bool? isDeleted;
  Learning? learning;
  UserModel? user;
  List<Exams>? exams;

  Students({this.idStudent,
    this.idUser,
    this.isDeleted,
    this.learning,
    this.user,
    this.exams});

  Students.fromJson(Map<String, dynamic> json) {
    idStudent = json['idStudent'];
    idUser = json['idUser'];
    isDeleted = json['isDeleted'];
    learning = json['Learning'] != null
        ? new Learning.fromJson(json['Learning'])
        : null;
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
    if (json['Exams'] != null) {
      exams = <Exams>[];
      json['Exams'].forEach((v) {
        exams!.add(new Exams.fromJson(v));
      });
    }
  }
}
