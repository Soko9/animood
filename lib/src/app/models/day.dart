import 'package:animood/src/app/models/spirit.dart';

class Day {
  const Day({
    required this.id,
    required this.dateTime,
    this.mood = SpiritMood.none,
    this.notes,
    this.image,
  });

  final int id;
  final DateTime dateTime;
  final SpiritMood mood;
  final String? notes;
  final String? image;

  Day copyWith({SpiritMood? mood, String? notes, String? image}) => Day(
    id: id,
    dateTime: dateTime,
    mood: mood ?? this.mood,
    notes: notes ?? this.notes,
    image: image ?? this.image,
  );

  static final List<Day> all = [
    Day(
      id: 0,
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
      mood: SpiritMood.all[0],
      notes:
          'Felt really good today. Had more energy than usual and '
          'things just flowed easily. Even the small moments felt enjoyable, '
          'and I caught myself smiling for no big reason. Overall a light, '
          'positive day that I’d like to have more often.',
    ),
    Day(
      id: 1,
      dateTime: DateTime.now().subtract(const Duration(days: 9)),
      mood: SpiritMood.all[3],
    ),
    Day(
      id: 2,
      dateTime: DateTime.now().subtract(const Duration(days: 8)),
      mood: SpiritMood.all[2],
    ),
    Day(
      id: 3,
      dateTime: DateTime.now().subtract(const Duration(days: 7)),
      mood: SpiritMood.all[6],
    ),
    Day(
      id: 4,
      dateTime: DateTime.now().subtract(const Duration(days: 6)),
      mood: SpiritMood.all[5],
      notes:
          'Felt really irritated today. Little things kept getting under my skin, '
          'and I had a hard time staying patient. I noticed myself snapping more than usual. '
          'Not my best day, but I’m aware of it and hoping tomorrow feels calmer.',
    ),
    Day(
      id: 5,
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      mood: SpiritMood.all[3],
      notes:
          'Felt pretty low and worn out today. Didn’t have much '
          'energy to do anything, even small tasks felt heavier '
          'than usual. Nothing in particular went wrong, just '
          'one of those days where everything felt a bit dull '
          'and tiring. Hoping tomorrow feels lighter.',
    ),
    Day(
      id: 6,
      dateTime: DateTime.now().subtract(const Duration(days: 4)),
      mood: SpiritMood.all[0],
    ),
    Day(
      id: 7,
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Day(
      id: 8,
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      mood: SpiritMood.all[4],
      notes:
          'Felt pretty down today. There was a heaviness that stuck around most of the day, '
          'and it was hard to stay motivated or interested in things. '
          'I kept to myself more than usual. Hoping this feeling passes soon.',
    ),
    Day(
      id: 9,
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      mood: SpiritMood.all[2],
    ),
    Day(
      id: 10,
      dateTime: DateTime.now(),
    ),
  ];
}
