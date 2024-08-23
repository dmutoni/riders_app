import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/data/models/car_model.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';

class CarDetailsScreen extends ConsumerWidget {
  static const String routeName = '/car-details';
  final CarModel? carModel;
  const CarDetailsScreen({super.key, this.carModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CarouselSliderController carCarouselController = CarouselSliderController();

    return Scaffold(
      extendBody: true,
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
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(
            Dimens.marginDefault,
          ),
          child: ListView(
            children: [
              Text(
                carModel?.name ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: Dimens.marginMedium,
                    color: ThemeColors.yellow,
                  ),
                  const SizedBox(
                    width: Dimens.marginSmall,
                  ),
                  Text(
                    '${carModel?.rate} (reviews: ${carModel?.reviews})',
                  ),
                ],
              ),
              CarouselSlider(
                carouselController: carCarouselController,
                options: CarouselOptions(height: 150.0),
                items: carModel?.imageUrls?.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Image.asset(
                          i,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(
                'Specifications',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Dimens.marginSmall),
              Row(
                children: [
                  ...intersperse(
                    const SizedBox(
                      width: Dimens.marginSmall,
                    ),
                    [
                      _buildSpecification(
                        const Icon(
                          Icons.battery_charging_full_outlined,
                          size: Dimens.marginMedium,
                        ),
                        'Max. power',
                        carModel?.maxPower,
                        context,
                      ),
                      _buildSpecification(
                        const Icon(
                          Icons.edgesensor_high_outlined,
                          size: Dimens.marginMedium,
                        ),
                        'Fuel',
                        carModel?.fuel,
                        context,
                      ),
                      _buildSpecification(
                        const Icon(
                          Icons.speed_sharp,
                          size: Dimens.marginMedium,
                        ),
                        'Max. speed',
                        carModel?.maxSpeed,
                        context,
                      ),
                      _buildSpecification(
                        const Icon(
                          Icons.speaker_notes_rounded,
                          size: Dimens.marginMedium,
                        ),
                        '0-60mph',
                        carModel?.speed60Mph,
                        context,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: Dimens.marginBig),
              Text(
                'Car features',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Dimens.marginSmall),
              ...intersperse(
                const SizedBox(
                  height: Dimens.marginSmall,
                ),
                [
                  _buildFeature(
                    'Model',
                    carModel?.model,
                    context,
                  ),
                  _buildFeature(
                    'Capacity',
                    carModel?.capacity,
                    context,
                  ),
                  _buildFeature(
                    'Color',
                    carModel?.color,
                    context,
                  ),
                  _buildFeature(
                    'Fuel type',
                    carModel?.fuel,
                    context,
                  ),
                  _buildFeature(
                    'Geat type',
                    carModel?.gearType,
                    context,
                  ),
                ],
              ),
              const SizedBox(
                height: Dimens.marginDefault,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        // context.go('/select-transport');
                      },
                      title: 'Book later',
                      variant: AppButtonVariant.light,
                    ),
                  ),
                  const SizedBox(
                    width: Dimens.marginDefault,
                  ),
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        // context.go('/select-transport');
                      },
                      title: 'Ride Now',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(
    String? label,
    String? value,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.green,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: ThemeColors.green5,
      ),
      padding: const EdgeInsets.all(
        Dimens.marginDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ThemeColors.grey,
                ),
          ),
          Text(
            value ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ThemeColors.grey,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecification(
    Widget? icon,
    String? label,
    String? value,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.green,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: ThemeColors.green5,
      ),
      height: 105,
      width: 84,
      padding: const EdgeInsets.all(
        Dimens.marginDefault,
      ),
      child: Column(
        children: [
          icon ?? const SizedBox(),
          const SizedBox(width: Dimens.marginSmall),
          Column(
            children: [
              Text(
                label ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ThemeColors.grey,
                      fontSize: 12,
                    ),
              ),
              Text(
                value ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ThemeColors.grey,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
