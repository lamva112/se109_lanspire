import 'package:flutter/material.dart';

class BottomLineIndicator extends Decoration {
  const BottomLineIndicator({
    this.color = Colors.white,
    this.height = 2,
    this.radius = const Radius.circular(8),
  });
  final Color color;
  final double height;
  final Radius radius;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BottomLinePainter(
      color: color,
      height: height,
      radius: radius,
      onChange: onChanged,
    );
  }
}

class _BottomLinePainter extends BoxPainter {
  _BottomLinePainter({
    required this.color,
    required this.height,
    required this.radius,
    VoidCallback? onChange,
  })  : _paint = Paint()
    ..style = PaintingStyle.fill
    ..color = color,
  // .. = height,
        super(onChange);
  final Color color;
  final double height;
  final Radius radius;
  final Paint _paint;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    var rect = offset & configuration.size!;
    Rect square2 = Rect.fromLTWH(
        rect.left, rect.bottom - height, rect.right - rect.left, height);
    canvas.drawRRect(RRect.fromRectAndRadius(square2, radius), _paint);
  }
}
