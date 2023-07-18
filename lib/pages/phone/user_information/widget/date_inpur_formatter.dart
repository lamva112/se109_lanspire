import 'package:flutter/services.dart';

import 'package:flutter/services.dart';

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _formatDate(newValue.text);
    return TextEditingValue(
      text: formattedText,
      selection: newValue.selection,
      composing: newValue.composing,
    );
  }

  String _formatDate(String input) {
    if (input.isEmpty) return '';

    final cleanInput = input.replaceAll(RegExp('[^0-9]'), '');

    if (cleanInput.length < 8) return cleanInput;

    final day = cleanInput.substring(0, 2);
    final month = cleanInput.substring(2, 4);
    final year = cleanInput.substring(4, 8);

    return '$day/$month/$year';
  }
}
