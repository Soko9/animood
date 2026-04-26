import 'dart:ui' show Color;

import 'package:animood/src/core/app_colors.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class SpiritMood {
  const SpiritMood({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
  });

  final String id;
  final String name;
  final String description;
  final Color color;
  final String icon;

  static const SpiritMood none = SpiritMood(
    id: 'none',
    name: 'None',
    description: 'No spirit mood selected.',
    color: AppColors.text,
    icon: GameIcons.cross_mark,
  );

  bool get isNone => id == 'none';

  static const List<SpiritMood> all = [
    SpiritMood(
      id: 'happy',
      name: 'Joy Hound',
      description:
          'Your inner dog is wagging its tail—full of joy, energy, and love for the moment.',
      color: AppColors.happy,
      icon: GameIcons.sitting_dog,
    ),
    SpiritMood(
      id: 'calm',
      name: 'Serene Deer',
      description:
          'Like a quiet deer in the forest, you’re grounded, gentle, and at peace.',
      color: AppColors.calm,
      icon: GameIcons.deer,
    ),
    SpiritMood(
      id: 'neutral',
      name: 'Steady Penguin',
      description:
          'Your penguin is just going with the flow—steady, balanced, and taking things as they come.',
      color: AppColors.neutral,
      icon: GameIcons.penguin,
    ),
    SpiritMood(
      id: 'low',
      name: 'Weary Sloth',
      description:
          'Your sloth is moving slow today—low energy, seeking rest and a little extra care.',
      color: AppColors.low,
      icon: GameIcons.sloth,
    ),
    SpiritMood(
      id: 'sad',
      name: 'Gloomy Hopper',
      description:
          'A quiet frog in the rain—soft, reflective, and feeling the weight of emotions.',
      color: AppColors.sad,
      icon: GameIcons.frog,
    ),
    SpiritMood(
      id: 'angry',
      name: 'Rage Wyvern',
      description:
          'Your dragon is awarke—fiery, intense, and ready to release what’s been building up.',
      color: AppColors.angry,
      icon: GameIcons.sea_dragon,
    ),
    SpiritMood(
      id: 'stressed',
      name: 'Frenzy Squirrel',
      description:
          'Like a busy squirrel, your mind is racing—juggling too much and needing a pause.',
      color: AppColors.stressed,
      icon: GameIcons.squirrel,
    ),
  ];
}
