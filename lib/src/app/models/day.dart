import 'package:animood/src/app/models/spirit.dart';

class Day {
  const Day({
    required this.id,
    required this.dateTime,
    this.mood,
    this.notes,
    this.image,
  });

  final int id;
  final DateTime dateTime;
  final SpiritMood? mood;
  final String? notes;
  final String? image;

  static final List<Day> all = [
    Day(
      id: 0,
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
      mood: SpiritMood.all[0],
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
    ),
    Day(
      id: 5,
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      mood: SpiritMood.all[3],
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
