import 'package:flutter/material.dart';

class TwoColorCircleProgressIndicator extends StatelessWidget {
  final double progress;
  final Color color1;
  final Color color2;
  final double size;
  final double strokeWidth;
  final Widget? child;

  const TwoColorCircleProgressIndicator({
    super.key,
    required this.progress,
    required this.color1,
    required this.color2,
    required this.size,
    required this.strokeWidth,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: OnboardingProgressIndicator(
            progress: progress,
            color1: color1,
            color2: color2,
            strokeWidth: strokeWidth,
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}

class OnboardingProgressIndicator extends CustomPainter {
  final double progress;
  final Color color1;
  final Color color2;
  final double strokeWidth;

  OnboardingProgressIndicator({
    required this.progress,
    required this.color1,
    required this.color2,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;

    Paint paint1 = Paint()
      ..color = color1
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    Paint paint2 = Paint()
      ..color = color2
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the first segment of the circle (progressed part)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -90 * 0.0174533, // Start angle in radians
      360 * progress * 0.0174533, // Sweep angle in radians based on progress
      false,
      paint1,
    );

    // Draw the remaining segment of the circle
    if (progress < 1.0) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        (-90 + 360 * progress) * 0.0174533, // Start angle in radians
        360 *
            (1.0 - progress) *
            0.0174533, // Sweep angle in radians for the remaining part
        false,
        paint2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
