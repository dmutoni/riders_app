import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';

Color? colorPrimary = const AppColors().primaryColor;

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme({
  required BuildContext context,
  required bool isDarkTheme,
}) {
  return ThemeData(
    useMaterial3: true,
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        primaryColor:
            isDarkTheme ? ThemeColors.black : ThemeColors.orangePrimaryColor,
        accentColor: isDarkTheme ? Colors.pink : Colors.pinkAccent,
        backgroundColor: isDarkTheme ? Colors.yellow : Colors.limeAccent,
        textColor: isDarkTheme ? Colors.white : Colors.black,
        secondaryColor: isDarkTheme ? Colors.green : Colors.greenAccent,
        successColor: isDarkTheme ? Colors.green : Colors.greenAccent,
        errorColor: isDarkTheme ? Colors.red : Colors.redAccent,
        iconColor: isDarkTheme ? Colors.grey : Colors.grey[300],
        secondaryTextColor: isDarkTheme ? ThemeColors.blue : ThemeColors.blue,
      ),
    ],
    scaffoldBackgroundColor:
        isDarkTheme ? ThemeColors.black : ThemeColors.white,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: colorPrimary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? ThemeColors.white : ThemeColors.grey,
        height: 30 / 24,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? ThemeColors.white : ThemeColors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: Dimens.marginMedium,
        fontWeight: FontWeight.w400,
        color: isDarkTheme ? ThemeColors.white : ThemeColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: Dimens.marginFourteen,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? ThemeColors.white : ThemeColors.lightGrey,
      ),
      bodyMedium: TextStyle(
        fontSize: Dimens.marginDefault,
        fontWeight: FontWeight.w400,
        color: isDarkTheme ? ThemeColors.white : ThemeColors.lightGrey,
        wordSpacing: 1.5,
        height: 24 / 16,
      ),
      labelLarge: TextStyle(
        fontSize: Dimens.marginLarge,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? ThemeColors.white : ThemeColors.black,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ThemeColors.primaryAccent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            vertical: Dimens.marginDefault,
            horizontal: Dimens.marginMedium,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimens.radiusDefault,
            ),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all<Color>(ThemeColors.primaryAccent),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            vertical: Dimens.marginDefault,
            horizontal: Dimens.marginMedium,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimens.radiusDefault,
            ),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all<Color>(ThemeColors.primaryAccent),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Dimens.radiusDefault,
        ),
        borderSide: const BorderSide(
          color: ThemeColors.grey,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.transparent,
      labelStyle: TextStyle(
        color: isDarkTheme ? ThemeColors.grey : ThemeColors.grey,
      ),
      focusColor: colorPrimary,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(
          ThemeColors.black.withOpacity(0.5),
        ),
      ),
    ),
  );
}

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
);
