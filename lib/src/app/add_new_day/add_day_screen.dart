import 'dart:async';
import 'dart:math';

import 'package:animood/src/app/models/day.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/widgets/spirit_carousel.dart';
import 'package:animood/src/core/app_colors.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class AddDayScreen extends StatefulWidget {
  const AddDayScreen({super.key});

  @override
  State<AddDayScreen> createState() => _AddDayScreenState();
}

class _AddDayScreenState extends State<AddDayScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _notesController = TextEditingController();

  Day _day = Day(
    id: DateTime.now().millisecondsSinceEpoch,
    dateTime: DateTime.now(),
  );

  SpiritMood get _mood => _day.mood.isNone ? SpiritMood.all.first : _day.mood;

  void _setDayMood(SpiritMood value) {
    setState(() {
      _day = _day.copyWith(mood: value);
    });
  }

  // void _setDayImage(String? value) {
  //   setState(() {
  //     _day.copyWith(image: value);
  //   });
  // }

  void _resetDay() {
    setState(() {
      _day = _day.copyWith(mood: SpiritMood.none);
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: 850.milliseconds,
    );
    _animationController.value = _animationController.upperBound;
    _resetDay();
    super.initState();
  }

  @override
  void dispose() {
    _notesController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (_, _) => Stack(
          children: [
            ClipOval(
              clipper: CircleRevealClipper(
                value: _animationController.value,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: .all(width: 3, color: _mood.color),
                  color: _mood.color.withValues(alpha: 0.05),
                ),
              ),
            ),
            ColoredBox(
              color: _mood.color.withValues(alpha: 0.05),
              child: Padding(
                padding: const .only(top: 24, left: 12, right: 12, bottom: 12),
                child: _buildBody(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        _buildBackButton(context),
        Text(
          'How are you feeling today?',
          textAlign: .center,
          style: context.textTheme.displayLarge,
        ),
        (context.sh * 0.075).vGap,
        SpiritCarousel(
          onChange: (index) {
            _setDayMood(SpiritMood.all[index]);
            unawaited(_animationController.forward(from: 0));
          },
          centerSpirit: _mood,
          scale: 1.4,
          viewport: 0.4,
          isAnimating: false,
          showExtras: false,
          showMood: true,
        ),
        12.vGap,
        TextField(
          controller: _notesController,
          maxLines: 4,
          style: context.textTheme.displaySmall?.copyWith(
            color: AppColors.text,
          ),
          cursorColor: AppColors.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: _mood.color.withValues(alpha: 0.4),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: _mood.color),
              borderRadius: .circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 4, color: _mood.color),
              borderRadius: .circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: _mood.color,
          ),
        ),
        Transform.rotate(
          angle: pi / 4,
          child: AnimatedContainer(
            duration: 350.milliseconds,
            decoration: BoxDecoration(
              color: _mood.color,
              border: .all(width: 3, color: _mood.color),
              borderRadius: .circular(4),
            ),
            margin: const .only(top: 38, right: 24, bottom: 24, left: 24),
            child: Transform.rotate(
              angle: -(pi / 4),
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Iconify(
                  GameIcons.check_mark,
                  color: AppColors.background,
                ),
                constraints: const .tightFor(),
                padding: .zero,
                visualDensity: .compact,
              ),
            ),
          ),
        ),
      ],
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
