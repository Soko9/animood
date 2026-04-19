import 'package:animood/src/app/models/spirit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController {
  void onSpiritChanged(int index) {
    currentSpirit.value = Spirit.all[index];
  }

  final ValueNotifier<Spirit> currentSpirit = ValueNotifier(Spirit.all[0]);
  set currentSpirit(Spirit value) {
    currentSpirit.value = value;
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
