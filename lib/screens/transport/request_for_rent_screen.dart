import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:riders_app/data/models/car_model.dart';
import 'package:riders_app/screens/transport/thank_you_screen.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';
import 'package:riders_app/widgets/common/visual/location_details.dart';

class RequestForRentScreen extends ConsumerWidget {
  static const String routeName = '/request-for-rent';
  final CarModel? carModel;
  const RequestForRentScreen({Key? key, this.carModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
        title: Text(
          'Request for rent',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.marginDefault),
          child: ListView(
            children: [
              const LocationDetails(
                fromAddress: 'Current Location',
                fromDetails: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                toAddress: 'Office',
                toDetails: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                distance: '1.1 KM',
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.marginDefault,
                ),
                decoration: BoxDecoration(
                  color: ThemeColors.green5,
                  borderRadius: BorderRadius.circular(Dimens.marginSmall),
                  border: Border.all(
                    color: ThemeColors.green,
                    width: 1,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: Dimens.marginDefault,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          carModel?.name ?? '',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ThemeColors.black,
                                  ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: Dimens.marginMedium,
                              color: ThemeColors.yellow,
                            ),
                            Text('${carModel?.rate} ${carModel?.reviews} '),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    if (carModel?.imageUrls != null)
                      Image.asset(
                        carModel!.imageUrls![1],
                        width: 70,
                        height: 70,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: Dimens.marginSmall),
              Text(
                'Charge',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: Dimens.marginSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      text: 'Mustang/',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ThemeColors.grey,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'per hours',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 12,
                                    color: ThemeColors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${carModel?.pricePerHours}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ThemeColors.grey,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      text: 'Vat',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ThemeColors.grey,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '5%',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 12,
                                    color: ThemeColors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${carModel?.tax}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ThemeColors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: Dimens.marginDefault,
              ),
              Text(
                'Select payment method',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: Dimens.marginSmall,
              ),
              ...intersperse(
                const SizedBox(
                  height: Dimens.marginSmall,
                ),
                [
                  _buildPaymentMethod(
                    context: context,
                    expiryDate: '12/26',
                    icon: const Icon(
                      Icons.credit_score,
                    ),
                    value: '**** **** **** 1234',
                    isSelected: true,
                  ),
                  _buildPaymentMethod(
                    context: context,
                    expiryDate: '12/26',
                    icon: const Icon(
                      Icons.credit_score,
                    ),
                    value: '**** **** **** 1234',
                  ),
                  _buildPaymentMethod(
                    context: context,
                    expiryDate: '12/26',
                    icon: const Icon(
                      Icons.credit_score,
                    ),
                    value: 'maliaddress@mail.com',
                  ),
                  _buildPaymentMethod(
                    context: context,
                    expiryDate: '12/26',
                    icon: const Icon(
                      Icons.credit_score,
                    ),
                    value: 'Cash',
                  ),
                ],
              ),
              const SizedBox(
                height: Dimens.marginDefault,
              ),
              AppButton(
                title: 'Confirm Ride',
                onTap: () => {
                  context.pushNamed(
                    ThankYouScreen.routeName,
                  ),
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod({
    Icon? icon,
    String? value,
    String? expiryDate,
    required BuildContext context,
    bool? isSelected,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ThemeColors.green,
          ),
          borderRadius: BorderRadius.circular(Dimens.marginVerySmall),
          color:
              (isSelected ?? false) ? ThemeColors.green5 : ThemeColors.green6,
        ),
        padding: const EdgeInsets.all(
          Dimens.marginDefault,
        ),
        child: Row(
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: Dimens.marginSmall),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ThemeColors.grey,
                        fontSize: 12,
                      ),
                ),
                Text(
                  'Expires: $expiryDate',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ThemeColors.lightGrey,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
