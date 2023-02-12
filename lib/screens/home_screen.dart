import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/controller/home_controller.dart';
import 'package:tutorial_10/utils.dart';

import '../wigdets/wish_item.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 40,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Wish List',
                        style: textStyle(26, Colors.black, FontWeight.w600),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.shade200,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            '10',
                            style: textStyle(22, Colors.white, FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => homeController.changeTab('Wishes'),
                        child: Text(
                          'Wishes',
                          style: textStyle(
                              20,
                              homeController.tab.value == 'Wishes'
                                  ? Colors.black
                                  : Colors.grey,
                              FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () => homeController.changeTab('Fulfilled'),
                        child: Text(
                          'Fulfilled',
                          style: textStyle(
                              20,
                              homeController.tab.value == 'Fulfilled'
                                  ? Colors.black
                                  : Colors.grey,
                              FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  homeController.tab.value == 'Wishes'
                      ? ListView.builder(
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WishItem();
                          },
                        )
                      : ListView.builder(
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
