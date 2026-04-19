import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get sh => MediaQuery.sizeOf(this).height;
  double get sw => MediaQuery.sizeOf(this).width;
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

extension NumExtentsions on num {
  SizedBox get vGap => SizedBox(height: toDouble());
  SizedBox get hGap => SizedBox(width: toDouble());
}

extension DateTimeExtebsions on DateTime {
  String monthName({bool isShort = false}) => switch (month) {
    1 => isShort ? 'Jan' : 'January',
    2 => isShort ? 'Feb' : 'February',
    3 => isShort ? 'Mar' : 'March',
    4 => isShort ? 'Apr' : 'April',
    5 => isShort ? 'May' : 'May',
    6 => isShort ? 'Jun' : 'June',
    7 => isShort ? 'Jul' : 'July',
    8 => isShort ? 'Aug' : 'August',
    9 => isShort ? 'Sep' : 'September',
    10 => isShort ? 'Oct' : 'October',
    11 => isShort ? 'Nov' : 'November',
    12 => isShort ? 'Dec' : 'December',
    _ => '--',
  };

  String get currentCalendar => '${monthName()} ~ $year';

  String get getDateString => '$day ${monthName(isShort: true)} $year';
}

extension StringExtensions on String {
  RichText toSpiritName({
    required TextStyle titleStyle,
    required TextStyle subTitleStyle,
  }) {
    return RichText(
      textAlign: .center,
      text: TextSpan(
        text: split('\n').first,
        style: titleStyle.copyWith(height: 0.8, letterSpacing: 0.5),
        children: [
          TextSpan(
            text: '\n${split('\n').last}',
            style: subTitleStyle.copyWith(height: 0.5, letterSpacing: 2.4),
          ),
        ],
      ),
    );
  }
}
