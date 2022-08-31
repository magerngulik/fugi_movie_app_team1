import 'package:flutter/material.dart';
import 'package:flutter_course/home.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({
    Key? key,
  }) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
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
                  'Login to FUGI Movie',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(77, 0, 0, 0).withOpacity(1),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Please Enter the  Details below to Continue',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(77, 0, 0, 0).withOpacity(1),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  height: 35,
                ),
                Container(
                  child: const TextField(
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
                  child: const TextField(
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
                  height: 5,
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
