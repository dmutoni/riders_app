import 'package:flutter/material.dart';

class _MaterialLocalizationsRwDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _MaterialLocalizationsRwDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'rw';
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return MaterialLocalizationsRw();
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<MaterialLocalizations> old) {
    return false;
  }
}

class MaterialLocalizationsRw extends MaterialLocalizations {
  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _MaterialLocalizationsRwDelegate();

  @override
  String aboutListTileTitle(String applicationName) {
    return 'null';
  }

  @override
  String get alertDialogLabel => 'Kumenyesha Ikiganiro';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get backButtonTooltip => 'Inyuma';

  @override
  String get calendarModeButtonLabel => 'Kalendari';

  @override
  String get cancelButtonLabel => 'Kureka';

  @override
  String get closeButtonLabel => 'Funga';

  @override
  String get closeButtonTooltip => 'Funga';

  @override
  String get continueButtonLabel => 'Komeza';

  @override
  String get copyButtonLabel => 'Gukoporora';

  @override
  String get cutButtonLabel => 'Kata';

  @override
  String get dateHelpText => 'Injira itariki';

  @override
  String get dateInputLabel => 'Itariki';

  @override
  String get dateOutOfRangeLabel => 'Ntibishoboka';

  @override
  String get datePickerHelpText => 'Itariki';

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) {
    return 'null';
  }

  @override
  String get dateRangeEndLabel => 'Iherezo';

  @override
  String get dateRangePickerHelpText => 'Itariki';

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) {
    return 'null';
  }

  @override
  String get dateRangeStartLabel => 'Tangira';

  @override
  String get dateSeparator => '-';

  @override
  String get deleteButtonTooltip => 'Siba';

  @override
  String get dialModeButtonLabel => 'Hamagara';

  @override
  String get dialogLabel => 'Ikiganiro';

  @override
  String get drawerLabel => 'Igishushanyo';

  @override
  int get firstDayOfWeekIndex => 0;

  @override
  String formatCompactDate(DateTime date) {
    return 'null';
  }

  @override
  String formatDecimal(int number) {
    return 'null';
  }

  @override
  String formatFullDate(DateTime date) {
    return 'null';
  }

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return 'null';
  }

  @override
  String formatMediumDate(DateTime date) {
    return 'null';
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    return 'null';
  }

  @override
  String formatMonthYear(DateTime date) {
    return 'null';
  }

  @override
  String formatShortDate(DateTime date) {
    return 'null';
  }

  @override
  String formatShortMonthDay(DateTime date) {
    return 'null';
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay,
      {bool alwaysUse24HourFormat = false}) {
    return 'null';
  }

  @override
  String formatYear(DateTime date) {
    return 'null';
  }

  @override
  String get hideAccountsLabel => 'Hisha';

  @override
  String get inputDateModeButtonLabel => 'Itariki yo kwinjiza';

  @override
  String get inputTimeModeButtonLabel => 'Igihe cyo kwinjiza';

  @override
  String get invalidDateFormatLabel => 'Itariki itemewe';

  @override
  String get invalidDateRangeLabel => 'Itariki ntarengwa';

  @override
  String get invalidTimeLabel => 'Igihe kitemewe';

  @override
  String licensesPackageDetailText(int licenseCount) {
    return 'null';
  }

  @override
  String get licensesPageTitle => 'null';

  @override
  String get modalBarrierDismissLabel => 'Vanamo';

  @override
  String get moreButtonTooltip => 'Ibindi';

  @override
  List<String> get narrowWeekdays => [];

  @override
  String get nextMonthTooltip => 'Ukwezi gutaha';

  @override
  String get nextPageTooltip => 'Urupapuro rukurikira';

  @override
  String get okButtonLabel => 'Ok';

  @override
  String get openAppDrawerTooltip => 'Fungura igikurura';

  @override
  String pageRowsInfoTitle(
      int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return 'null';
  }

  @override
  DateTime? parseCompactDate(String? inputString) {
    throw UnimplementedError();
  }

  @override
  String get pasteButtonLabel => 'Shyira';

  @override
  String get popupMenuLabel => 'Ibikubiyemo';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Ukwezi gushize';

  @override
  String get previousPageTooltip => 'Urupapuro rwambere';

  @override
  String get refreshIndicatorSemanticLabel => 'Kuvugurura ibipimo';

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    return 'null';
  }

  @override
  String get reorderItemDown => 'Andika ikintu hasi';

  @override
  String get reorderItemLeft => 'Gusubiramo ikintu gisigaye';

  @override
  String get reorderItemRight => 'Andika ikintu neza';

  @override
  String get reorderItemToEnd => 'Kwandika ibintu kugirango birangire';

  @override
  String get reorderItemToStart => 'Andika ikintu kugirango utangire';

  @override
  String get reorderItemUp => 'Andika ibintu hejuru';

  @override
  String get rowsPerPageTitle => 'Imirongo kurupapuro';

  @override
  String get saveButtonLabel => 'Bika';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Shakisha';

  @override
  String get selectAllButtonLabel => 'Hitamo byose';

  @override
  String get selectYearSemanticsLabel => 'Hitamo umwaka';

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    return 'null';
  }

  @override
  String get showAccountsLabel => 'Erekana konti';

  @override
  String get showMenuTooltip => 'Erekana menu';

  @override
  String get signedInLabel => 'Yinjiye';

  @override
  String tabLabel({int? tabIndex, int? tabCount}) =>
      'Tab $tabIndex bya $tabCount';

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) =>
      TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerDialHelpText => 'Tora umwanya';

  @override
  String get timePickerHourLabel => 'Isaha';

  @override
  String get timePickerHourModeAnnouncement => "Uburyo bw'isaha";

  @override
  String get timePickerInputHelpText => 'Uhitamo igihe';

  @override
  String get timePickerMinuteLabel => 'Iminota';

  @override
  String get timePickerMinuteModeAnnouncement => "Uburyo bw'iminota";

  @override
  String get unspecifiedDate => 'Itariki itazwi';

  @override
  String get unspecifiedDateRange => 'Itariki itazwi';

  @override
  String get viewLicensesButtonLabel => 'Reba impushya';

  @override
  String get firstPageTooltip => 'Urupapuro rwa mbere';

  @override
  String get lastPageTooltip => 'Urupapuro rwanyuma';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => 'Channel Down';

  @override
  String get keyboardKeyChannelUp => 'Channel Up';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'Eject';

  @override
  String get keyboardKeyEnd => 'End';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'Home';

  @override
  String get keyboardKeyInsert => 'Insert';

  @override
  String get keyboardKeyMeta => 'Meta';

  @override
  String get keyboardKeyMetaMacOs => 'Command';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => 'Num /';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'Power';

  @override
  String get keyboardKeyPowerOff => 'Power Off';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'Select';

  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get menuBarMenuLabel => 'Menu';

  @override
  String get bottomSheetLabel => 'null';

  @override
  String get currentDateLabel => 'null';

  @override
  String get keyboardKeyShift => 'null';

  @override
  String get scrimLabel => 'null';

  @override
  String scrimOnTapHint(String modalRouteContentName) {
    return 'null';
  }

  @override
  // TODO: implement clearButtonTooltip
  String get clearButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement scanTextButtonLabel
  String get scanTextButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement selectedDateLabel
  String get selectedDateLabel => throw UnimplementedError();

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => throw UnimplementedError();
}
