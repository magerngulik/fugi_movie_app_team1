import 'package:flutter/material.dart';
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
          appBar: AppBar(
            title: Text("Login"),
          ),
        );
      },
    );
  }
}
