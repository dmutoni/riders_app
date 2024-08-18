import 'package:flutter/material.dart';

class EndlessCurve extends StatefulWidget {
  const EndlessCurve({super.key});

  @override
  _EndlessCurveState createState() => _EndlessCurveState();
}

class _EndlessCurveState extends State<EndlessCurve>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double _curveWidth = 200; // Width of the curve
  final double _curveHeight = 100; // Height of the curve
  final double _speed = 50; // Speed of the curve animation
  final double _curveSpacing = 10; // Spacing between curve segments
  final int _numCurves = 5; // Number of curve segments to display

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          height: _curveHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _numCurves,
            itemBuilder: (context, index) {
              final double translation =
                  (_controller.value * _speed) % (_curveWidth + _curveSpacing);
              return Transform.translate(
                offset: Offset(
                    -translation + index * (_curveWidth + _curveSpacing), 0),
                child: CurveSegment(width: _curveWidth, height: _curveHeight),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CurveSegment extends StatelessWidget {
  final double width;
  final double height;

  const CurveSegment({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final double curveWidth = size.width;
    final double curveHeight = size.height;

    final Path path = Path();

    // Start drawing the curve from the bottom left corner
    path.moveTo(0, curveHeight);

    // Draw the curve using quadratic bezier segments
    path.quadraticBezierTo(
        curveWidth / 4, curveHeight * 0.75, curveWidth / 2, curveHeight / 2);
    path.quadraticBezierTo(
        curveWidth * 0.75, curveHeight * 0.25, curveWidth, 0);

    // Draw the curve
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
