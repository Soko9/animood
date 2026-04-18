import 'package:animood/src/app/home/home_controller.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/spirit_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class Home extends WatchingWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final currentSpirit = watchValue(
      (HomeController controller) => controller.currentSpirit,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 0.5,
                    enlargeCenterPage: true,
                    enlargeStrategy: .zoom,
                    enlargeFactor: 0.8,
                    onPageChanged: (index, _) =>
                        di<HomeController>().onSpiritChanged(index),
                  ),
                  itemCount: Spirit.all.length,
                  itemBuilder: (_, index, _) {
                    final spirit = Spirit.all[index];
                    return SpiritWidget(
                      spirit: spirit,
                      showShadow: spirit == currentSpirit,
                      isAnimating: spirit == currentSpirit,
                    );
                  },
                ),
              ),
              Container(
                color: currentSpirit.color,
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
