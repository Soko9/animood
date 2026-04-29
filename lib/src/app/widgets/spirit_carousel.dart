import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/spirit_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpiritCarousel extends StatelessWidget {
  const SpiritCarousel({
    required this.onChange,
    required this.centerSpirit,
    this.scale = 1.2,
    this.viewport = 0.45,
    this.showExtras = true,
    this.isAnimating = true,
    this.showMood = false,
    super.key,
  });

  final void Function(int index) onChange;
  final SpiritMood centerSpirit;
  final double scale;
  final double viewport;
  final bool showExtras;
  final bool isAnimating;
  final bool showMood;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: viewport,
          enlargeCenterPage: true,
          enlargeStrategy: .zoom,
          enlargeFactor: 0.8,
          onPageChanged: (index, _) => onChange(index),
        ),
        itemCount: SpiritMood.all.length,
        itemBuilder: (_, index, _) {
          final spirit = SpiritMood.all[index];
          return SpiritWidget(
            spirit: spirit,
            showExtras: showExtras && centerSpirit == spirit,
            isAnimating: isAnimating && centerSpirit == spirit,
            showMood: showMood,
          );
        },
      ),
    );
  }
}
