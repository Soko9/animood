import 'dart:async';

import 'package:animood/src/app/models/day.dart';
import 'package:animood/src/app/models/spirit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DayFormController {
  final ValueNotifier<Day> day = ValueNotifier(
    Day(
      id: DateTime.now().millisecondsSinceEpoch,
      dateTime: DateTime.now(),
    ),
  );

  SpiritMood get mood =>
      day.value.mood.isNone ? SpiritMood.all.first : day.value.mood;

  void setDayMood(SpiritMood value) {
    day.value = day.value.copyWith(mood: value);
    unawaited(animationController?.forward(from: 0));
  }

  void setDayImage(String? value) {
    day.value = day.value.copyWith(image: value);
  }

  void resetDay() {
    day.value = day.value.copyWith(mood: SpiritMood.none);
  }

  TextEditingController notesController = TextEditingController();
  AnimationController? animationController;

  void onInit(TickerProvider vsync) {
    notesController = TextEditingController();
    animationController ??= AnimationController(
      vsync: vsync,
      duration: 600.milliseconds,
    );
  }

  void onDispose() {
    resetDay();
    notesController.dispose();
    animationController?.stop();
    animationController?.dispose();
  }
}
