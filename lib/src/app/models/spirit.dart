import 'dart:ui' show Color;

import 'package:animood/src/core/app_colors.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class Spirit {
  const Spirit({
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

  static const List<Spirit> all = [
    Spirit(
      id: 'happy',
      name: 'Joy\nHound',
      description:
          'Your inner dog is wagging its tail—full of joy, energy, and love for the moment.',
      color: AppColors.happy,
      icon: GameIcons.sitting_dog,
    ),
    Spirit(
      id: 'calm',
      name: 'Serene\nDeer',
      description:
          'Like a quiet deer in the forest, you’re grounded, gentle, and at peace.',
      color: AppColors.calm,
      icon: GameIcons.deer,
    ),
    Spirit(
      id: 'neutral',
      name: 'Steady\nPenguin',
      description:
          'Your penguin is just going with the flow—steady, balanced, and taking things as they come.',
      color: AppColors.neutral,
      icon: GameIcons.penguin,
    ),
    Spirit(
      id: 'low',
      name: 'Weary\nSloth',
      description:
          'Your sloth is moving slow today—low energy, seeking rest and a little extra care.',
      color: AppColors.low,
      icon: GameIcons.sloth,
    ),
    Spirit(
      id: 'sad',
      name: 'Gloomy\nHopper',
      description:
          'A quiet frog in the rain—soft, reflective, and feeling the weight of emotions.',
      color: AppColors.sad,
      icon: GameIcons.frog,
    ),
    Spirit(
      id: 'angry',
      name: 'Rage\nWyvern',
      description:
          'Your dragon is awarke—fiery, intense, and ready to release what’s been building up.',
      color: AppColors.angry,
      icon: GameIcons.sea_dragon,
    ),
    Spirit(
      id: 'stressed',
      name: 'Frenzy\nSquirrel',
      description:
          'Like a busy squirrel, your mind is racing—juggling too much and needing a pause.',
      color: AppColors.stressed,
      icon: GameIcons.squirrel,
    ),
  ];
}
