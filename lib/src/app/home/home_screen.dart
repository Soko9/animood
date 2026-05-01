import 'package:animood/src/app/add_new_day/add_day_screen.dart';
import 'package:animood/src/app/home/home_controller.dart';
import 'package:animood/src/app/models/day.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/day_date_banner.dart';
import 'package:animood/src/app/widgets/day_widget.dart';
import 'package:animood/src/app/widgets/quote_widget.dart';
import 'package:animood/src/app/widgets/spirit_carousel.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

class HomeScreen extends WatchingWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = di<HomeController>();
    final days = watchValue(
      (HomeController controller) => controller.days,
    );
    final currentSpirit = watchValue(
      (HomeController controller) => controller.currentSpirit,
    );
    final currentDay = watchValue(
      (HomeController controller) => controller.currentDay,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              _buildCarousel(context, controller, currentSpirit, currentDay),
              _buildMonthYear(currentSpirit, context),
              38.vGap,
              _buildCalendar(
                context,
                days,
                currentSpirit,
                currentDay,
                controller,
              ),
              if (currentDay != null)
                Expanded(
                  child: AnimatedSize(
                    duration: 450.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    child: SizedBox(
                      height: .infinity,
                      child: SingleChildScrollView(
                        padding: const .all(12),
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            DayDateBanner(
                              date: currentDay.dateTime,
                              color: currentDay.mood.color,
                              strokeWidth: 5,
                            ),
                            18.vGap,
                            Text(
                              'You felt ${currentDay.mood.isNone ? 'nothing' : '${currentDay.mood.id}  as a'}',
                              textAlign: .center,
                              style: context.textTheme.displaySmall,
                            ),
                            if (!currentDay.mood.isNone)
                              Text(
                                currentDay.mood.name,
                                textAlign: .center,
                                style: context.textTheme.displayMedium
                                    ?.copyWith(
                                      fontWeight: .bold,
                                      color: currentDay.mood.color,
                                    ),
                              ),
                            18.vGap,
                            if (currentDay.notes.isNotNullOrEmpty)
                              Column(
                                mainAxisSize: .min,
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    'You wrote and I quote',
                                    style: context.textTheme.titleLarge,
                                  ),
                                  QuoteWidget(
                                    quote: currentDay.notes!,
                                    color: currentDay.mood.color,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar(
    BuildContext context,
    List<Day> days,
    SpiritMood currentSpirit,
    Day? currentDay,
    HomeController controller,
  ) {
    return SizedBox(
      height: context.sh * 0.35,
      child: GridView.count(
        padding: const .all(12),
        crossAxisCount: 4,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        children:
            // controller
            //     .getDaysBetween()
            days
                .map(
                  (day) => GestureDetector(
                    onTap: () {
                      if (day.dateTime.isToday && day.mood.isNone) {
                        context.push(const AddDayScreen());
                      } else {
                        if (controller.currentDay.value == day) {
                          controller.currentDay = null;
                        } else {
                          controller.currentDay = day;
                        }
                      }
                    },
                    child: DayWidget(
                      day: day,
                      // Day(
                      //   id: day.millisecondsSinceEpoch,
                      //   dateTime: day,
                      // ),
                      currentMoodColor: currentSpirit.color,
                      currentDay: currentDay,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildMonthYear(SpiritMood currentSpirit, BuildContext context) {
    return Stack(
      alignment: .center,
      children: [
        Container(
          color: currentSpirit.color.withValues(alpha: 0.2),
          height: 12,
          width: .infinity,
        ),
        Text(
          DateTime.now().currentCalendar,
          textAlign: .center,
          style: context.textTheme.displayMedium,
        ),
      ],
    );
  }

  Widget _buildCarousel(
    BuildContext context,
    HomeController controller,
    SpiritMood currentSpirit,
    Day? currentDay,
  ) {
    return AnimatedSize(
      duration: 450.milliseconds,
      curve: Curves.fastEaseInToSlowEaseOut,
      child: SizedBox(
        height: currentDay == null ? context.sh * 0.375 : 0,
        child: SpiritCarousel(
          onChange: (index) => controller.onSpiritChanged(index),
          centerSpirit: currentSpirit,
        ),
      ),
    );
  }
}
