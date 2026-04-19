import 'package:animood/src/app/models/day.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/core/app_colors.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    required this.day,
    required this.currentMoodColor,
    super.key,
  });

  final Day day;
  final Color currentMoodColor;

  @override
  Widget build(BuildContext context) {
    final mood = day.mood ?? SpiritMood.none();
    final color = mood == SpiritMood.none()
        ? AppColors.background
        : AppColors.text;
    final isToday = day.dateTime.isToday;
    final isCurrentMood = mood.color == currentMoodColor;

    return Stack(
      clipBehavior: .none,
      alignment: .center,
      children: [
        AnimatedRotation(
          duration: 250.milliseconds,
          curve: Curves.ease,
          turns: (isToday || isCurrentMood) ? 0 : 0.025,
          child: AnimatedScale(
            duration: 250.milliseconds,
            curve: Curves.ease,
            scale: isCurrentMood ? 1.09 : 1,
            child: AnimatedContainer(
              duration: 250.milliseconds,
              curve: Curves.ease,
              padding: const .all(4),
              alignment: .center,
              decoration: BoxDecoration(
                color: mood.color,
                borderRadius: isToday ? null : .circular(4),
                shape: isToday ? .circle : .rectangle,
                border: isToday
                    ? Border.all(
                        width: 2,
                        color: currentMoodColor,
                      )
                    : null,
              ),
              child: Column(
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  Text(
                    day.dateTime.getDateString,
                    textAlign: .center,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: .bold,
                    ),
                  ),
                  Iconify(
                    mood.icon,
                    size: 16,
                    color: color,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isToday)
          AnimatedPositioned(
            duration: 750.milliseconds,
            curve: Curves.ease,
            top: -14,
            left: 12,
            width: isCurrentMood ? 0 : 20,
            height: isCurrentMood ? 0 : 20,
            child: const Iconify(
              GameIcons.pin,
              size: 20,
              color: AppColors.text,
            ),
          ),
      ],
    );
  }
}
