import '../enums.dart';

extension StringExtenstion on String? {
  Gender? convertToGenderEnum() {
    switch (this) {
      case "MALE":
        return Gender.male;
      case "FEMALE":
        return Gender.female;
      case "OTHER":
        return Gender.other;
    }
    return null;
  }

}
