import 'package:flutter/material.dart';
import 'package:nagwa_books/flavors.dart';
import 'package:nagwa_books/nagwa_task_app.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/services/services_init.dart';
import 'package:nagwa_books/widgets/custom_error_widget.dart';

Future<void> main() async {
  ///** ****** ensure flutter Initialized ******** */
  WidgetsFlutterBinding.ensureInitialized();

  ///** ****** Initialize services ******** */
  await initServices();

  ///** ****** run my App UI ******** */
  runApp(const NagwaTaskApp());

  ///** ****** handling any unexpected or unhanding error  ******** */
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const CustomErrorWidget(
      showButton: false,
      message: "حدث خطأ غير متوقع. يرجى إعادة المحاولة لاحقًا.",
    );
  };
}

Future<void> initServices() async {
  F.appFlavor = Flavor.prod;
  await ServicesInit().init();
}
