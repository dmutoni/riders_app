import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_starter_template/widgets/common/input/app_text_input.dart';
import 'package:flutter_starter_template/widgets/common/visual/confirm_address_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(
          Dimens.marginDefault,
        ),
        child: Column(
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
            const SizedBox(height: Dimens.marginDefault),

            const Divider(height: 1, color: ThemeColors.grey),

            const SizedBox(height: Dimens.marginDefault),
            const Column(
              children: [
                AppTextInput(
                  label: 'From',
                  leadingWidget: Icon(Icons.my_location),
                ),
                SizedBox(height: 8.0),
                // To Address Input
                AppTextInput(
                  label: 'To',
                  leadingWidget: Icon(Icons.location_on),
                ),
              ],
            ),
            const SizedBox(height: Dimens.marginDefault),
            // Recent Places
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.place),
                    title: const Text('Office'),
                    subtitle: const Text(
                        '2972 Westheimer Rd. Santa Ana, Illinois 85486'),
                    trailing: const Text('2.7km'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.place),
                    title: const Text('Coffee shop'),
                    subtitle:
                        const Text('1901 Thornridge Cir. Shiloh, Hawaii 81063'),
                    trailing: const Text('1.1km'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.place),
                    title: const Text('Shopping center'),
                    subtitle: const Text(
                        '4140 Parker Rd. Allentown, New Mexico 31134'),
                    trailing: const Text('4.9km'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.place),
                    title: const Text('Shopping mall'),
                    subtitle: const Text(
                        '4140 Parker Rd. Allentown, New Mexico 31134'),
                    trailing: const Text('4.0km'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            AppButton(
              title: 'Continue',
              onTap: () {
                context.pop();
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.transparent,
                  context: context,
                  // isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  builder: (context) => const ConfirmAddressBottomSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
