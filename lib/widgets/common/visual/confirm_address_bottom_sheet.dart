import 'package:flutter/material.dart';
import 'package:flutter_starter_template/screens/transport/select_transport_screen.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_starter_template/widgets/common/visual/dotted_line.dart';
import 'package:go_router/go_router.dart';

class ConfirmAddressBottomSheet extends StatelessWidget {
  const ConfirmAddressBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: ThemeColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.marginDefault),
            topRight: Radius.circular(Dimens.marginDefault),
          ),
        ),
        padding: const EdgeInsets.all(Dimens.marginDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust height based on content
          children: [
            const SizedBox(height: 8.0),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Select address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(height: 1, color: Colors.grey),
            const SizedBox(height: 16.0),
            Row(
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
                        'Current location',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '2972 Westheimer Rd. Santa Ana, Illinois 85486',
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
                                  'Office',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                          Text('1.1km',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            AppButton(
              title: 'Confirm Location',
              onTap: () {
                context.pushNamed(
                  SelectTransportScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
