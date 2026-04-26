import 'package:animood/src/core/app_colors.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';

class DayDateBanner extends StatelessWidget {
  const DayDateBanner({
    required this.date,
    this.color = AppColors.text,
    this.strokeWidth = 3,
    this.dateSpace = 8,
    super.key,
  });

  final DateTime date;
  final Color color;
  final double strokeWidth;
  final double dateSpace;

  @override
  Widget build(BuildContext context) {
    final peripherals = Expanded(
      child: Container(
        height: strokeWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: .circular(strokeWidth),
        ),
      ),
    );

    return Row(
      spacing: dateSpace,
      children: [
        peripherals,
        Text(
          'The day was ${date.getDateString(
            withNewLine: false,
          )}',
          textAlign: .center,
          style: context.textTheme.titleLarge,
        ),
        peripherals,
      ],
    );
  }
}
