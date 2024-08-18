enum AppTopSnackbarLevel { warning, alert }

extension AppTopSnackbarLevelExtension on String {
  AppTopSnackbarLevel get asSnackbarThreshold {
    switch (this) {
      case 'warning':
        return AppTopSnackbarLevel.warning;
      default:
        return AppTopSnackbarLevel.alert;
    }
  }
}
