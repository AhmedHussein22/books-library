import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_books/config/cubit/cubit_observer.dart';
import 'package:nagwa_books/flavors.dart';
import 'package:nagwa_books/nagwa_task_app.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/services/services_init.dart';

Future<void> main() async {
  ///** ****** ensure flutter Initialized ******** */
  WidgetsFlutterBinding.ensureInitialized();

  ///** ****** Initialize services ******** */
  await initServices();

  ///** ****** run my App UI ******** */

  runApp(
    DevicePreview(
      enabled: true, // Wrap your app
      builder: (final context) => const NagwaTaskApp(), // Wrap your app
    ),
  );
}

Future<void> initServices() async {
  F.appFlavor = Flavor.dev;
  Bloc.observer = DebugCubitObserver();
  await ServicesInit().init();
}
