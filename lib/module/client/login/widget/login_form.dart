import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/client/dashboard/view/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFormView> createState() => _logState();
}

class _logState extends State<LoginFormView> {
  String email = "admin@demo.com";
  String password = "123456";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(77, 0, 0, 0).withOpacity(1),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Please Enter the  Details below to Continue',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(77, 0, 0, 0).withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  height: 25,
                ),
                Container(
                  child: TextFormField(
                    initialValue: email,
                    onFieldSubmitted: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 20,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(95, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    initialValue: password,
                    onFieldSubmitted: (value) {
                      password = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black26,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 20,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(95, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  width: 275,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 14, 13, 13).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () async {
                      print("LOGIN?");
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        //----->
                        Get.offAll(DashboardView());
                      } on Exception catch (_) {
                        Get.snackbar("Error", "Your Request Failed");
                      }
                    },
                    child: const Center(
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(MdiIcons.google),
                        label: const Text("Google"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn(
                            scopes: [
                              'email',
                            ],
                          );

                          try {
                            await googleSignIn.disconnect();
                          } catch (_) {}

                          try {
                            GoogleSignInAccount? googleSignInAccount =
                                await googleSignIn.signIn();
                            GoogleSignInAuthentication
                                googleSignInAuthentication =
                                await googleSignInAccount!.authentication;
                            final AuthCredential credential =
                                GoogleAuthProvider.credential(
                              accessToken:
                                  googleSignInAuthentication.accessToken,
                              idToken: googleSignInAuthentication.idToken,
                            );
                            var userCredential = await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            debugPrint("userCredential: $userCredential");
                            //TODO: on login success
                            //------------------
                            Get.offAll(DashboardView());
                          } catch (_) {}
                        },
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(MdiIcons.facebook),
                        label: const Text("Facebook"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                      ),
                    ],
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
