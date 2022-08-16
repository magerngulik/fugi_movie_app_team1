import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/firebase_options.dart';
import 'package:fugi_movie_app/module/admin/admin_main_navigation/view/admin_main_navigation_view.dart';
import 'package:fugi_movie_app/shared/util/theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900),
      theme: defaultTheme,
      home: AdminMainNavigationView(),
    ),
  );
}
