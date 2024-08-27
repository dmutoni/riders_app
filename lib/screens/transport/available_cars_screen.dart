import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riders_app/data/models/car_model.dart';
import 'package:riders_app/enums/widget_configurations/app_button_variant.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/screens/transport/car_details_screen.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';

class AvailableCarsScreen extends StatefulWidget {
  static const String routeName = '/available-cars';

  const AvailableCarsScreen({super.key});

  @override
  State<AvailableCarsScreen> createState() => _AvailableCarsScreenState();
}

class _AvailableCarsScreenState extends State<AvailableCarsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAvailableCars();
    });
  }

  List<CarModel> availableCars = [];

  void getAvailableCars() async {
    final secureStorageServiceHelper = SecureStorageServiceHelper();

    await secureStorageServiceHelper.saveCarDetails();

    availableCars = await secureStorageServiceHelper.getCarDetails();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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

                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      CarDetailsScreen.routeName,
                      extra: option,
                    ),
                    child: _buildCarOption(
                      context: context,
                      carName: option.name,
                      image: option.imageUrls != null
                          ? Image.asset(
                              option.imageUrls![0],
                              width: 100,
                              height: 50,
                            )
                          : null,
                      carDetails: option.color != null
                          ? '${option.gearType} | ${option.numberOfSeats} seats | ${option.color}  '
                          : '',
                      location: option.location,
                      onTap: () => context.pushNamed(
                        CarDetailsScreen.routeName,
                        extra: option,
                      ),
                    ),
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
    VoidCallback? onTap,
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
                  onTap: () {
                    onTap?.call();
                  },
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: AppButton(
                  title: 'Ride Now',
                  onTap: () {
                    onTap?.call();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
