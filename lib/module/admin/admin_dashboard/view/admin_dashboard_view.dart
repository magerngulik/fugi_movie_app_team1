import 'package:flutter/material.dart';
import '../controller/admin_dashboard_controller.dart';
import 'package:get/get.dart';

class AdminDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminDashboardController>(
      init: AdminDashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("AdminDashboard"),
          ),
          bottomNavigationBar: SizedBox(
            height: 90.0,
            child: Center(
              child: Obx(() {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.loading.value == true)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                                strokeWidth: 1.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Loading...",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://i.ibb.co/3pPYd14/freeban.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://i.ibb.co/3pPYd14/freeban.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://i.ibb.co/3pPYd14/freeban.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://i.ibb.co/3pPYd14/freeban.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: const [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            "0 asfafsasfa fsaf asfa sfasf asf asf asf asfas afs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asafs af asfas",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: List.generate(controller.menus.length, (index) {
                      var item = controller.menus[index];
                      return InkWell(
                        onTap: () {
                          item["onTap"]();
                        },
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 40) / 4,
                          height: (MediaQuery.of(context).size.width - 40) / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item["icon"],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                item["label"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  Divider(),
                  Wrap(
                    children:
                        List.generate(controller.appMenus.length, (index) {
                      var item = controller.appMenus[index];
                      return InkWell(
                        onTap: () {
                          item["onTap"]();
                        },
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 40) / 4,
                          height: (MediaQuery.of(context).size.width - 40) / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item["icon"],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                item["label"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
