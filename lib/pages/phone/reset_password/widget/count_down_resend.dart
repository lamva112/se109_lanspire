import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../widgets/ink_well_wrapper.dart';

class CountDownResend extends StatefulWidget {
  final Duration duration;
  final Function()? onCallback;
  final TextStyle? textStyle;
  final String title;
  final EdgeInsetsGeometry padding;

  const CountDownResend({
    Key? key,
    required this.duration,
    this.onCallback,
    this.textStyle,
    required this.title,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  State<CountDownResend> createState() => _CountDownResendState();
}

class _CountDownResendState extends State<CountDownResend> {
  late Duration duration;
  Timer? timer;
  bool isResend = false;

  @override
  void initState() {
    super.initState();
    duration = widget.duration;
    startCount();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void startCount() {
    timer?.cancel();
    duration = widget.duration;
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      duration = Duration(seconds: seconds);
      if (seconds == 0) {
        setState(() {
          isResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return isResend
        ? InkWellWrapper(
            paddingChild: widget.padding,
            onTap: () {
              startCount();
              setState(() {
                isResend = false;
              });
            },
            child: Text(
              " ${widget.title}",
              style: widget.textStyle,
            ),
          )
        : Padding(
            padding: widget.padding,
            child: Text(
              ' ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: widget.textStyle,
            ),
          );
  }
}
