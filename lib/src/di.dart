import 'package:animood/src/app/add_new_day/day_form_controller.dart';
import 'package:animood/src/app/home/home_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

void setupDi() {
  di
    ..registerSingleton<HomeController>(HomeController())
    ..registerSingleton<DayFormController>(DayFormController());
}
