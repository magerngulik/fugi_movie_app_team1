import 'package:flutter/material.dart';
import '../controller/welcome_controller.dart';

import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Welcome"),
          ),
        );
      },
    );
  }
}