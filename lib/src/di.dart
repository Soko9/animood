import 'package:animood/src/app/home/home_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

void setupDi() {
  di.registerSingleton<HomeController>(HomeController());
}
