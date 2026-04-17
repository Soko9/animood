import 'dart:ui' show Color;

import 'package:animood/src/core/app_colors.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class Spirit {
  const Spirit({
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
  });

  static const List<Spirit> all = [
    Spirit(
      name: 'Happy',
      description:
          'Your inner dog is wagging its tail—full of joy, energy, and love for the moment.',
      color: AppColors.happy,
      icon: GameIcons.sitting_dog,
    ),
    Spirit(
      name: 'Calm',
      description:
          'Like a quiet deer in the forest, you’re grounded, gentle, and at peace.',
      color: AppColors.calm,
      icon: GameIcons.deer,
    ),
    Spirit(
      name: 'Neutral',
      description:
          'Your penguin is just going with the flow—steady, balanced, and taking things as they come.',
      color: AppColors.neutral,
      icon: GameIcons.penguin,
    ),
    Spirit(
      name: 'Low',
      description:
          'Your sloth is moving slow today—low energy, seeking rest and a little extra care.',
      color: AppColors.low,
      icon: GameIcons.sloth,
    ),
    Spirit(
      name: 'Sad',
      description:
          'A quiet frog in the rain—soft, reflective, and feeling the weight of emotions.',
      color: AppColors.sad,
      icon: GameIcons.frog,
    ),
    Spirit(
      name: 'Angry',
      description:
          'Your dragon is awake—fiery, intense, and ready to release what’s been building up.',
      color: AppColors.angry,
      icon: GameIcons.spiked_dragon_head,
    ),
    Spirit(
      name: 'Stressed',
      description:
          'Like a busy squirrel, your mind is racing—juggling too much and needing a pause.',
      color: AppColors.stressed,
      icon: GameIcons.squirrel,
    ),
  ];
  final String name;
  final String description;
  final Color color;

  final String icon;
}
