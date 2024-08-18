import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';

enum AppTopSnackbarVariant { message, error }

extension AppTopSnackbarVariantContent on AppTopSnackbarVariant {
  Color get backgroundColor {
    switch (this) {
      case AppTopSnackbarVariant.message:
        return ThemeColors.green;
      case AppTopSnackbarVariant.error:
        return ThemeColors.red;
    }
  }
}
