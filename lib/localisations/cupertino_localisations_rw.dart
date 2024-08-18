import 'package:flutter/cupertino.dart';

class CupertinoLocalizationsRwDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const CupertinoLocalizationsRwDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'rw';
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return CupertinoLocalizationsRw();
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<CupertinoLocalizations> old) {
    return false;
  }
}

class CupertinoLocalizationsRw extends CupertinoLocalizations {
  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      CupertinoLocalizationsRwDelegate();

  @override
  String get alertDialogLabel => throw UnimplementedError();

  @override
  String get anteMeridiemAbbreviation => throw UnimplementedError();

  @override
  String get copyButtonLabel => 'Gukoporora';

  @override
  String get cutButtonLabel => 'Kata';

  static const List<String> _shortWeekdays = <String>[
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static const List<String> _months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  // @override
  // String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour o'clock";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) return '1 minute';
    return '$minute minutes';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  String get pasteButtonLabel => 'Shyira';

  @override
  String get postMeridiemAbbreviation => throw UnimplementedError();

  @override
  String get searchTextFieldPlaceholderLabel => throw UnimplementedError();

  @override
  String get selectAllButtonLabel => 'Hitamo byose';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    throw UnimplementedError();
  }

  @override
  String timerPickerHour(int hour) {
    throw UnimplementedError();
  }

  @override
  String? timerPickerHourLabel(int hour) {
    throw UnimplementedError();
  }

  @override
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  String timerPickerMinute(int minute) {
    throw UnimplementedError();
  }

  @override
  String? timerPickerMinuteLabel(int minute) {
    throw UnimplementedError();
  }

  @override
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  String timerPickerSecond(int second) {
    throw UnimplementedError();
  }

  @override
  String? timerPickerSecondLabel(int second) {
    throw UnimplementedError();
  }

  @override
  List<String> get timerPickerSecondLabels => throw UnimplementedError();

  @override
  String get todayLabel => throw UnimplementedError();

  @override
  // TODO: implement noSpellCheckReplacementsLabel
  String get noSpellCheckReplacementsLabel => throw UnimplementedError();

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) =>
      dayIndex.toString();

  @override
  // TODO: implement clearButtonLabel
  String get clearButtonLabel => throw UnimplementedError();

  @override
  String datePickerStandaloneMonth(int monthIndex) {
    // TODO: implement datePickerStandaloneMonth
    throw UnimplementedError();
  }

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => throw UnimplementedError();
}
