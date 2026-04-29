import 'dart:math';

import 'package:animood/src/app/add_new_day/day_form_controller.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/spirit_carousel.dart';
import 'package:animood/src/core/app_colors.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class AddDayScreen extends WatchingStatefulWidget {
  const AddDayScreen({super.key});

  @override
  State<AddDayScreen> createState() => _AddDayScreenState();
}

class _AddDayScreenState extends State<AddDayScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller = di<DayFormController>();

    callOnce((_) => controller.onInit(this));

    onDispose(controller.onDispose);

    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.animationController!,
        builder: (_, _) => Stack(
          children: [
            ClipOval(
              clipper: CircleRevealClipper(
                value: controller.animationController!.value,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: .all(width: 6, color: controller.mood.color),
                  color: controller.mood.color.withValues(alpha: 0.035),
                ),
              ),
            ),
            ColoredBox(
              color: controller.mood.color.withValues(alpha: 0.035),
              child: Padding(
                padding: const .only(top: 24, left: 12, right: 12, bottom: 12),
                child: _buildBody(controller, context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(DayFormController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        _buildBackButton(controller, context),
        Text(
          'How are you feeling today?',
          textAlign: .center,
          style: context.textTheme.displayLarge,
        ),
        (context.sh * 0.075).vGap,
        SpiritCarousel(
          onChange: (index) => controller.setDayMood(SpiritMood.all[index]),
          centerSpirit: controller.mood,
          scale: 1.6,
          viewport: 0.35,
          isAnimating: false,
          showExtras: false,
          showMood: true,
        ),
        12.vGap,
        TextField(
          controller: controller.notesController,
          maxLines: 4,
          style: context.textTheme.displaySmall?.copyWith(
            color: AppColors.text,
          ),
          cursorColor: AppColors.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: controller.mood.color.withValues(alpha: 0.4),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: controller.mood.color),
              borderRadius: .circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 4, color: controller.mood.color),
              borderRadius: .circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(
    DayFormController controller,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: controller.mood.color,
        borderRadius: .circular(4),
      ),
      padding: const .all(6),
      margin: const .symmetric(vertical: 24, horizontal: 12),
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        constraints: const .tightFor(),
        padding: .zero,
        visualDensity: .compact,
      ),
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  CircleRevealClipper({required this.value});

  final double value;

  @override
  Rect getClip(Size size) {
    final maxRadius = sqrt(size.width * size.width + size.height * size.height);
    final radius = value * maxRadius;
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
