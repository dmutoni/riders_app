import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riders_app/values/assets/login_assets.dart';

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController phoneController;
  final String flagAsset;

  const PhoneNumberInput({
    Key? key,
    required this.phoneController,
    this.flagAsset = LoginAssets.flag,
  }) : super(key: key);

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String countryCode = '+250';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          SvgPicture.asset(
            widget.flagAsset,
            width: 32.0,
            height: 32.0,
          ),
          const SizedBox(width: 8.0),
          DropdownButton<String>(
            value: countryCode,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down),
            items: ['+250', '+1', '+91']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                countryCode = newValue!;
              });
            },
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: widget.phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Your mobile number',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
