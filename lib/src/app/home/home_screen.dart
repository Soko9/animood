import 'package:animood/src/app/home/home_controller.dart';
import 'package:animood/src/app/models/day.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/day_widget.dart';
import 'package:animood/src/app/widgets/spirit_widget.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class HomeScreen extends WatchingWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = di<HomeController>();
    final currentSpirit = watchValue(
      (HomeController controller) => controller.currentSpirit,
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
              _buildCarousel(context, controller, currentSpirit),
              _buildMonthYear(currentSpirit, context),
              38.vGap,
              SizedBox(
                height: context.sh * 0.5,
                child: GridView.count(
                  padding: const .all(12),
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children:
                      // controller
                      //     .getDaysBetween()
                      Day.all
                          .map(
                            (date) => DayWidget(
                              day: date,
                              // Day(
                              //   id: date.millisecondsSinceEpoch,
                              //   dateTime: date,
                              // ),
                              currentMoodColor: currentSpirit.color,
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
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
  ) {
    return SizedBox(
      height: context.sh * 0.3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 0.5,
          enlargeCenterPage: true,
          enlargeStrategy: .zoom,
          enlargeFactor: 0.8,
          onPageChanged: (index, _) => controller.onSpiritChanged(index),
        ),
        itemCount: SpiritMood.all.length,
        itemBuilder: (_, index, _) {
          final spirit = SpiritMood.all[index];
          return SpiritWidget(
            spirit: spirit,
            showExtras: spirit == currentSpirit,
            isAnimating: spirit == currentSpirit,
          );
        },
      ),
    );
  }
}
