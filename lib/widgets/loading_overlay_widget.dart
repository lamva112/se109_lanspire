import 'package:flutter/material.dart';

import '../core/base/loading_widget.dart';

class LoadingOverLayWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color indicatorColor;
  final AlignmentGeometry alignment;
  final Color? overlayColor;
  final String? titleKeyStr;

  const LoadingOverLayWidget({
    Key? key,
    required this.isLoading,
    required this.child,
    this.indicatorColor = Colors.black,
    this.alignment = AlignmentDirectional.topStart,
    this.overlayColor,
    this.titleKeyStr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        IgnorePointer(
          child: child,
          ignoring: isLoading,
        ),
        if (isLoading) ...[
          Container(
            color: overlayColor ?? Colors.black.withOpacity(0.03),
          ),
          LoadingWidget(
            titleKeyStr: titleKeyStr,
            //indicatorColor: indicatorColor,
          ),
        ],
      ],
    );
  }
}
