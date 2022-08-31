import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/client/login/widget/login_form.dart';
import 'package:fugi_movie_app/module/client/login/widget/login_blur_background.dart';
import '../controller/login_controller.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Stack(
            children: const [
              LoginBlurBackground(),
              LoginFormView(),
            ],
          ),
        );
      },
    );
  }
}
