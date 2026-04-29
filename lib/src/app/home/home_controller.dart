import 'package:animood/src/app/models/day.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ValueNotifier<List<Day>> days = ValueNotifier(Day.all);
  void addLastDay(Day value) {
    days.value
      ..removeLast()
      ..add(value);
  }

  void onSpiritChanged(int index) {
    currentSpirit.value = SpiritMood.all[index];
  }

  final ValueNotifier<SpiritMood> currentSpirit = ValueNotifier(
    SpiritMood.all[0],
  );
  set currentSpirit(SpiritMood value) {
    currentSpirit.value = value;
  }

  final ValueNotifier<Day?> currentDay = ValueNotifier(null);
  set currentDay(Day? value) {
    currentDay.value = value;
  }

  List<DateTime> getDaysBetween() {
    final today = DateTime.now();
    final tenDaysAgo = today.subtract(const Duration(days: 10));

    final start = tenDaysAgo.isBefore(today) ? tenDaysAgo : today;
    final end = tenDaysAgo.isBefore(today) ? today : tenDaysAgo;

    final daysToGenerate = end.difference(start).inDays + 1;

    return List.generate(daysToGenerate, (i) => start.add(Duration(days: i)));
  }
}
