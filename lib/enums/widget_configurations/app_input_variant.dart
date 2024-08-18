import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/theme/styles.dart';

enum AppInputVariant { dark, light, clear, search }

extension AppInputVariantValues on AppInputVariant {
  Color get backgroundColor {
    switch (this) {
      case AppInputVariant.dark:
        return ThemeColors.darkGreen;
      case AppInputVariant.light:
        return ThemeColors.white;
      case AppInputVariant.clear:
        return Colors.transparent;
      case AppInputVariant.search:
        return ThemeColors.lightGrey;
    }
  }

  Color get disabledBackgroundColor {
    switch (this) {
      case AppInputVariant.dark:
        return ThemeColors.darkGreen;
      case AppInputVariant.light:
        return ThemeColors.lightGrey;
      case AppInputVariant.clear:
        return Colors.transparent;
      case AppInputVariant.search:
        return ThemeColors.lightGrey;
    }
  }

  Color get textColor {
    switch (this) {
      case AppInputVariant.dark:
        return ThemeColors.white;
      case AppInputVariant.light:
        return ThemeColors.black;
      case AppInputVariant.clear:
        return ThemeColors.white;
      case AppInputVariant.search:
        return ThemeColors.white;
    }
  }

  Color get disabledTextColor {
    switch (this) {
      case AppInputVariant.dark:
        return ThemeColors.lightGrey.withOpacity(0.8);
      case AppInputVariant.light:
        return ThemeColors.darkGrey;
      case AppInputVariant.clear:
        return ThemeColors.white;
      case AppInputVariant.search:
        return ThemeColors.lightGrey;
    }
  }

  Color get borderColor {
    switch (this) {
      case AppInputVariant.dark:
        return ThemeColors.darkGrey;
      case AppInputVariant.light:
        return ThemeColors.grey;
      case AppInputVariant.clear:
        return ThemeColors.lightGrey;
      case AppInputVariant.search:
        return ThemeColors.lightGrey;
    }
  }

  Color get selectedBorderColor {
    switch (this) {
      case AppInputVariant.dark:
        return ThemeColors.darkGrey;
      case AppInputVariant.light:
        return ThemeColors.grey;
      case AppInputVariant.clear:
        return ThemeColors.lightGrey;
      case AppInputVariant.search:
        return ThemeColors.lightGrey;
    }
  }

  double get inputHeight {
    switch (this) {
      case AppInputVariant.dark:
      case AppInputVariant.light:
      case AppInputVariant.clear:
        return Dimens.inputHeight;
      case AppInputVariant.search:
        return Dimens.searchInputHeight;
    }
  }

  TextStyle get errorTextStyle {
    switch (this) {
      case AppInputVariant.search:
      case AppInputVariant.light:
        return Styles.errorTextStyleRed;
      case AppInputVariant.dark:
      case AppInputVariant.clear:
        return Styles.errorTextStyleWhite;
    }
  }

  Widget? get leadingWidget {
    switch (this) {
      case AppInputVariant.search:
        return null;
      case AppInputVariant.dark:
      case AppInputVariant.light:
      case AppInputVariant.clear:
        return null;
    }
  }
}
