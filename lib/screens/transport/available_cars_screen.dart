import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/values/assets/transport_assets.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AvailableCarsScreen extends ConsumerWidget {
  static const String routeName = '/available-cars';

  const AvailableCarsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> availableCars = [
      {
        'carName': 'BMW Cabrio',
        'image': Image.asset(
          TransportAssets.availableCar,
        ),
        'carDetails': 'Automatic | 3 seats | Octane',
        'location': 'Lagos',
      },
      {
        'carName': 'BMW Cabrio',
        'image': Image.asset(
          TransportAssets.availableCar,
        ),
        'carDetails': 'Automatic | 3 seats | Octane',
        'location': 'Lagos',
      },
      {
        'carName': 'BMW Cabrio',
        'image': Image.asset(
          TransportAssets.availableCar,
        ),
        'carDetails': 'Automatic | 3 seats | Octane',
        'location': 'Lagos',
      },
      {
        'carName': 'BMW Cabrio',
        'image': Image.asset(
          TransportAssets.availableCar,
        ),
        'carDetails': 'Automatic | 3 seats | Octane',
        'location': 'Lagos',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(
            Dimens.marginDefault,
          ),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
                Text(
                  'Back',
                ),
              ],
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          Dimens.marginDefault,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available cars for ride',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('${availableCars.length} cars found'),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 170,
                  crossAxisCount: 1,
                  // childAspectRatio: 1,
                  mainAxisSpacing: 16,
                ),
                itemCount: availableCars.length,
                itemBuilder: (context, index) {
                  final option = availableCars[index];

                  return _buildCarOption(
                    context: context,
                    carName: option['carName'],
                    image: option['image'],
                    carDetails: option['carDetails'],
                    location: option['location'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarOption({
    String? carName,
    Widget? image,
    String? carDetails,
    String? location,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.lightGreen,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carName ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(carDetails ?? ''),
                    const SizedBox(height: 4.0),
                    Text(location ?? ''),
                  ],
                ),
              ),
              image ?? const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  variant: AppButtonVariant.light,
                  title: 'Book Later',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: AppButton(
                  title: 'Ride Now',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
