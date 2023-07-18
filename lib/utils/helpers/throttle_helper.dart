import 'package:rxdart/rxdart.dart';

class ThrottleHelper<T extends Function> {
  late final PublishSubject<T> throttler;

  ThrottleHelper() {
    throttler = PublishSubject<T>();
  }

  Function() throttle(int throttleDurationInMillis, T function) {
    throttler.throttleTime(Duration(milliseconds: throttleDurationInMillis)).forEach(
      (f) {
        f();
      },
    );

    return () {
      throttler.add(function);
    };
  }

  dispose() {
    throttler.close();
  }
}
