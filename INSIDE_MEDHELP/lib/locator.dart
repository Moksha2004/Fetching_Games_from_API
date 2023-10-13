//import 'package:fluttercamera/camera.dart';
import 'package:get_it/get_it.dart';
import 'package:inside_medhelp/camera.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
}