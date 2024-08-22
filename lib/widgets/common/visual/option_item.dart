import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';

class OptionItem extends StatelessWidget {
  final String label;
  final Widget image;
  final double? width;
  final double? height;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionItem({
    Key? key,
    required this.label,
    required this.image,
    this.width = 50,
    this.height = 50,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(
          Dimens.marginDefault,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ThemeColors.green5 : ThemeColors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? ThemeColors.green2 : ThemeColors.lightGrey,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: Dimens.marginDefault,
            ),
            image,
            const SizedBox(
              height: Dimens.marginDefault,
            ),
            Text(
              label,
            ),
          ],
        ),
      ),
    );
  }
}
