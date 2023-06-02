import '../../../enums.dart';

class ImageModel {
  String? path;
  ImageType? type;

  ImageModel({this.path, this.type});

  ImageModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    type = ImageType.values.byName(json['type']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['path'] = path;
    data['type'] = type?.name;
    return data;
  }
}
