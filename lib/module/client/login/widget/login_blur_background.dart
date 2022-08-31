import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class LoginBlurBackground extends StatelessWidget {
  const LoginBlurBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Blur(
          blur: 5,
          blurColor: const Color.fromARGB(255, 85, 84, 82),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black87,
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/img_login_5.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/img_login_3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 290,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/img_login_4.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
