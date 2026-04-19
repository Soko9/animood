import 'package:animood/src/app/home/home_controller.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/spirit_widget.dart';
import 'package:animood/src/core/app_colors.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
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
              Stack(
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
              ),
              38.vGap,
              SizedBox(
                height: context.sh * 0.5,
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: controller
                      .getDaysBetween()
                      .map(
                        (date) => Stack(
                          clipBehavior: .none,
                          alignment: .center,
                          children: [
                            Transform.rotate(
                              angle: 0.12,
                              child: Container(
                                padding: const .all(4),
                                alignment: .center,
                                decoration: BoxDecoration(
                                  color: currentSpirit.color,
                                  borderRadius: .circular(4),
                                ),
                                child: Text(
                                  date.getDateString,
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontWeight: .bold,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: -14,
                              left: 12,
                              child: Iconify(
                                GameIcons.pin,
                                size: 20,
                                color: AppColors.text,
                              ),
                            ),
                          ],
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

  Widget _buildCarousel(
    BuildContext context,
    HomeController controller,
    Spirit currentSpirit,
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
        itemCount: Spirit.all.length,
        itemBuilder: (_, index, _) {
          final spirit = Spirit.all[index];
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
