import 'package:animood/src/app/models/spirit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconify_flutter/iconify_flutter.dart' show Iconify;

class SpiritWidget extends StatelessWidget {
  const SpiritWidget({
    required this.spirit,
    this.size = 120,
    this.showShadow = false,
    this.isAnimating = false,
    super.key,
  });

  final Spirit spirit;
  final double size;
  final bool showShadow;
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    final speed = 1.seconds;
    final distance = size * 0.05;
    final shadowRadius = size * 0.65;

    return Column(
      mainAxisSize: .min,
      children: [
        _buildIcon(speed, distance, isAnimating),
        if (showShadow) _buildShadow(speed, shadowRadius, isAnimating),
      ],
    );
  }

  Widget _buildIcon(Duration speed, double distance, bool isAnimating) {
    final widget = Iconify(
      spirit.icon,
      color: spirit.color,
      size: size,
    );

    return isAnimating
        ? widget
              .animate(
                autoPlay: isAnimating,
                onPlay: (controller) => controller.repeat(),
              )
              .moveY(begin: -distance, end: 0, duration: speed)
              .moveY(
                begin: 0,
                end: -distance,
                duration: speed,
                delay: speed,
              )
        : widget;
  }

  Widget _buildShadow(Duration speed, double shadowRadius, bool isAnimating) {
    final widget = Container(
      height: shadowRadius * 0.5,
      width: shadowRadius,
      decoration: BoxDecoration(
        color: spirit.color.withValues(alpha: 0.15),
        borderRadius: .all(
          .elliptical(shadowRadius * 0.5, shadowRadius * 0.25),
        ),
        border: Border.all(
          color: spirit.color,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: spirit.color.withValues(alpha: 0.8),
            blurRadius: 8,
            blurStyle: .outer,
          ),
        ],
      ),
    );

    return isAnimating
        ? widget
              .animate(
                autoPlay: true,
                onPlay: (controller) => controller.repeat(),
              )
              .scale(
                begin: const Offset(0.6, 0.6),
                end: const Offset(1, 1),
                duration: speed,
              )
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(0.6, 0.6),
                duration: speed,
                delay: speed,
              )
        : widget;
  }
}
