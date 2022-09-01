import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/client/dashboard/view/dashboard_view.dart';
import 'package:fugi_movie_app/module/client/login/view/login_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/profile_controller.dart';

import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            leading: Container(),
            leadingWidth: 0.0,
            elevation: 0.0,
            backgroundColor: Colors.blueGrey[800],
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("Profile"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(DashboardView());
                },
                icon: const Icon(
                  Icons.logout,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: FirebaseAuth.instance.currentUser == null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your are not logged in"),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.login),
                        label: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () => Get.offAll(LoginView()),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxHeight: 110.0,
                        ),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey[800],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  "https://i.ibb.co/PGv8ZzG/me.jpg"),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Hello",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(
                                    "Jhonny Deep",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 16.0,
                                backgroundColor: Colors.blueGrey[900],
                                child: const Icon(
                                  Icons.edit,
                                  size: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 20.0,
                          right: 20.0,
                          bottom: 0.0,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        MdiIcons.movieOutline,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(
                                        "13K",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        MdiIcons.clockOutline,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(
                                        "25K",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      Text(
                                        "Watchtime (Hours)",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        MdiIcons.messageFlashOutline,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(
                                        "2K",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      Text(
                                        "Reviews",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Builder(
                          builder: (context) {
                            List items = [
                              {
                                "label": "Addresses",
                                "icon": Icons.pin_drop,
                                "on_tap": () {}
                              },
                              {
                                "label": "Referral code",
                                "icon": Icons.code,
                                "on_tap": () {}
                              },
                              {
                                "label": "Privacy Policy",
                                "icon": Icons.info,
                                "on_tap": () {}
                              },
                              {
                                "label": "TOS",
                                "icon": Icons.warning,
                                "on_tap": () {}
                              }
                            ];

                            return InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 12.0,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: ListView.builder(
                                  itemCount: items.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var item = items[index];
                                    return InkWell(
                                      onTap: () {
                                        if (item["on_tap"] != null) {
                                          item["on_tap"]!();
                                        }
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: ListTile(
                                            leading: Icon(
                                              item["icon"],
                                              size: 30.0,
                                              color: Colors.blueGrey,
                                            ),
                                            title: Text(
                                              item["label"],
                                              style: const TextStyle(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            trailing: const Icon(
                                              Icons.chevron_right,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
