import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riders_app/data/models/transport_type_model.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/screens/transport/available_cars_screen.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/visual/option_item.dart';

class SelectTransportScreen extends StatefulWidget {
  static const routeName = '/select-transport';
  const SelectTransportScreen({super.key});

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  int selectedTransport = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTransportOptions();
    });
  }

  List<TransportTypeModel> transportOptions = [];

  void getTransportOptions() async {
    final secureStorageServiceHelper = SecureStorageServiceHelper();

    await secureStorageServiceHelper.saveTransportDetails();

    transportOptions = await secureStorageServiceHelper.getTransportTypes();

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
        title: Text(
          'Select Transport',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          Dimens.marginDefault,
        ),
        child: Column(
          children: [
            Text(
              'Select your transport',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Dimens.marginBig),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: transportOptions.length,
                itemBuilder: (context, index) {
                  final option = transportOptions[index];
                  final isSelected =
                      selectedTransport == transportOptions.indexOf(option);

                  return OptionItem(
                    label: option.label ?? '',
                    image: Image.asset(
                      option.icon ?? '',
                    ),
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedTransport = transportOptions.indexOf(option);
                      });
                      context.pushNamed(
                        AvailableCarsScreen.routeName,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
