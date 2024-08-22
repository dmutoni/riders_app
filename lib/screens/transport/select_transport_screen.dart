import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/assets/transport_assets.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/visual/option_item.dart';
import 'package:go_router/go_router.dart';

class SelectTransportScreen extends StatefulWidget {
  static const routeName = '/select-transport';
  const SelectTransportScreen({super.key});

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  int selectedTransport = 0;

  final List<Map<String, dynamic>> transportOptions = [
    {
      'label': 'Car',
      'icon': Image.asset(
        TransportAssets.car,
      ),
      'color': Colors.red
    },
    {
      'label': 'Bike',
      'icon': Image.asset(
        TransportAssets.bike,
      ),
      'color': Colors.yellow
    },
    {
      'label': 'Cycle',
      'icon': Image.asset(
        TransportAssets.cycle,
      ),
      'color': Colors.black
    },
    {
      'label': 'Taxi',
      'icon': Image.asset(
        TransportAssets.taxi,
      ),
      'color': Colors.yellow
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    label: option['label'],
                    image: option['icon'],
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedTransport = transportOptions.indexOf(option);
                      });
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
