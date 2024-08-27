import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riders_app/screens/transport/select_transport_screen.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';
import 'package:riders_app/widgets/common/visual/location_details.dart';

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
            const LocationDetails(
              fromAddress: 'Current Location',
              fromDetails: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
              toAddress: 'Office',
              toDetails: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
              distance: '1.1 KM',
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
