import '../enums.dart';
import 'package:intl/intl.dart';

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

  String? covertToAppDateTime({
    String fromPattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    String toPattern = 'MM/dd/yyyy',
  }) {
    if (this != null && this!.isNotEmpty && this != '') {
      DateTime parseDate = DateFormat(fromPattern).parse(this ?? '');
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat(toPattern);
      var outputDate = outputFormat.format(inputDate);

      return outputDate.toString();
    }

    return null;
  }

  DateTime? convertToDateTimeDataTypes({String fromPattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    DateTime? parseDate;
    if (this != null) {
      parseDate = DateFormat(fromPattern).parse(this!);
    }
    return parseDate;
  }
}
