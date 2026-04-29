import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get sh => MediaQuery.sizeOf(this).height;
  double get sw => MediaQuery.sizeOf(this).width;
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  void push(Widget screen) => Navigator.of(this).push(
    MaterialPageRoute<dynamic>(builder: (_) => screen),
  );

  void pop() => Navigator.of(this).pop();
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

  String getDateString({bool withNewLine = true}) =>
      '$day ${monthName(isShort: true)}${withNewLine ? '\n' : ' '}$year';

  bool get isToday =>
      day == DateTime.now().day &&
      month == DateTime.now().month &&
      year == DateTime.now().year;
}

extension NStringExtensions on String? {
  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}

extension StringExtensions on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  RichText toSpiritName({
    required TextStyle titleStyle,
    required TextStyle subTitleStyle,
  }) {
    return RichText(
      textAlign: .center,
      text: TextSpan(
        text: contains(' ') ? '${split(" ").first}\n' : '',
        style: titleStyle.copyWith(height: 0.8, letterSpacing: 0.5),
        children: [
          TextSpan(
            text: split(' ').last.capitalize,
            style: subTitleStyle.copyWith(
              height: 0.5,
              letterSpacing: 2.4,
            ),
          ),
        ],
      ),
    );
  }
}

extension ColorExtension on Color {
  /// Lightens the color by [amount] (0.0 - 1.0)
  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );

    return lightened.toColor();
  }

  /// Darkens the color by [amount] (0.0 - 1.0)
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final darkened = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );

    return darkened.toColor();
  }
}
