import 'dart:async';
import 'dart:ui';

class DebouncerHelpers {
  final Duration duration;
  Timer? _timer;

  DebouncerHelpers({required this.duration});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(this.duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
