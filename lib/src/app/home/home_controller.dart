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
}
