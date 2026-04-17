import 'package:animood/src/app/models/spirit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconify_flutter/iconify_flutter.dart' show Iconify;

class SpiritWidget extends StatelessWidget {
  const SpiritWidget({
    required this.spirit,
    this.size = 120,
    super.key,
  });

  final Spirit spirit;
  final double size;

  @override
  Widget build(BuildContext context) {
    final speed = 2.seconds;
    final distance = size * 0.25;
    final shadowRadius = size * 0.65;

    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        _buildIcon(speed, distance),
        _buildShadow(speed, shadowRadius),
      ],
    );
  }

  Widget _buildIcon(Duration speed, double distance) {
    return Iconify(
          spirit.icon,
          color: spirit.color,
          size: size,
        )
        .animate(
          autoPlay: true,
          onPlay: (controller) => controller.repeat(),
        )
        .moveY(begin: -distance, end: 0, duration: speed)
        .moveY(
          begin: 0,
          end: -distance,
          duration: speed,
          delay: speed,
        );
  }

  Widget _buildShadow(Duration speed, double shadowRadius) {
    return Container(
          height: shadowRadius * 0.5,
          width: shadowRadius,
          decoration: BoxDecoration(
            color: spirit.color.withValues(alpha: 0.15),
            borderRadius: .all(
              .elliptical(shadowRadius * 0.5, shadowRadius * 0.25),
            ),
          ),
        )
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
        );
  }
}
