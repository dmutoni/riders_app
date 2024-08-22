import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Axis direction;

  const DottedLine({
    Key? key,
    this.height = 1.0,
    this.width = 1.0,
    this.color = Colors.black,
    this.direction = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double dashWidth = width;
        double dashHeight = height;
        double dashCount = (direction == Axis.horizontal
                ? constraints.constrainWidth()
                : constraints.constrainHeight()) /
            (2 * dashWidth);
        return Flex(
          direction: direction,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount.floor(), (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
