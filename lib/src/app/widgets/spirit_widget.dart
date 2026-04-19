import 'dart:math' as math;

import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconify_flutter/iconify_flutter.dart' show Iconify;

class SpiritWidget extends StatelessWidget {
  const SpiritWidget({
    required this.spirit,
    this.size = 120,
    this.showExtras = false,
    this.isAnimating = false,
    super.key,
  });

  final Spirit spirit;
  final double size;
  final bool showExtras;
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final speed = 2.seconds;
    final distance = size * 0.05;
    final shadowRadius = size * 0.8;

    return Stack(
      alignment: .bottomCenter,
      children: [
        Column(
          mainAxisSize: .min,
          children: [
            if (showExtras) _buildName(textTheme),
            16.vGap,
            _buildIcon(speed, distance, isAnimating),
            (shadowRadius * 0.5).vGap,
          ],
        ),
        if (showExtras)
          Positioned(
            bottom: 0,
            child: _buildShadow(speed, shadowRadius, isAnimating),
          ),
      ],
    );
  }

  Widget _buildName(TextTheme textTheme) {
    return spirit.name.toSpiritName(
      titleStyle: textTheme.titleSmall!.copyWith(
        color: spirit.color,
        fontWeight: .w100,
      ),
      subTitleStyle: textTheme.headlineLarge!.copyWith(
        color: spirit.color,
        fontWeight: .w900,
      ),
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
    final widget = Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        height: shadowRadius,
        width: shadowRadius,
        decoration: BoxDecoration(
          color: spirit.color.withValues(alpha: 0.15),
          border: Border.all(
            color: spirit.color.withValues(alpha: 0.3),
            width: 4,
          ),
          borderRadius: .circular(16),
          // shape: .circle,
          boxShadow: [
            BoxShadow(
              color: spirit.color.withValues(alpha: 0.25),
              blurRadius: 8,
              blurStyle: .outer,
            ),
          ],
        ),
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
