import 'package:flutter/material.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/widgets/common/visual/dotted_line.dart';

class LocationDetails extends StatelessWidget {
  final String fromAddress;
  final String fromDetails;
  final String toAddress;
  final String toDetails;
  final String distance;

  const LocationDetails({
    Key? key,
    required this.fromAddress,
    required this.fromDetails,
    required this.toAddress,
    required this.toDetails,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          children: [
            Icon(Icons.location_on, color: ThemeColors.red),
            SizedBox(
              height: 60,
              child: DottedLine(
                color: ThemeColors.green,
                direction: Axis.vertical,
                height: 2,
                width: 2,
              ),
            ),
            Icon(Icons.place, color: ThemeColors.green),
          ],
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fromAddress,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 4.0),
              Text(
                fromDetails,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toAddress,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          toAddress,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    distance,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
