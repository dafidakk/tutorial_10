import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/controller/home_controller.dart';
import 'package:tutorial_10/utils.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../wigdets/wish_item.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  HomeController homeController = Get.put(HomeController());

  TextEditingController pricecontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  openAddWishSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return Obx(
          () => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: SizedBox(
                height: 230,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 15, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          homeController.selectedPicture.isEmpty
                              ? InkWell(
                                  onTap: () => homeController.selectPicture(),
                                  child: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.grey,
                                    size: 45,
                                  ),
                                )
                              : InkWell(
                                  onTap: () => homeController.selectPicture(),
                                  child: Image(
                                    width: 64,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(
                                          homeController.selectedPicture.value),
                                    ),
                                  ),
                                ),
                          MyTextField(
                              textWidth:
                                  MediaQuery.of(context).size.width / 2.5,
                              controller: pricecontroller,
                              keyboardType: TextInputType.number,
                              hintText: 'Price',
                              obsecureText: false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                        textWidth: MediaQuery.of(context).size.width,
                        controller: titlecontroller,
                        hintText: 'Your Wish',
                        obsecureText: false),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: MyButton(
                        textWidth: MediaQuery.of(context).size.width * 0.8,
                        text: 'Add to my list',
                        onPressed: () => homeController
                            .addWish(titlecontroller.text,
                                double.parse(pricecontroller.text))
                            .then((value) {
                          titlecontroller.clear();
                          pricecontroller.clear();
                          homeController.selectedPicture.value = '';
                          Get.back();
                          Get.snackbar('Success', 'Wish Added');
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAddWishSheet(context),
        backgroundColor: Colors.lightBlue.shade200,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
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
                      IconButton(
                        onPressed: signUserOut,
                        icon: const Icon(Icons.logout),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: homeController.tab.value == 'Wishes'
                              ? homeController.getNumWishesStream(false)
                              : homeController.getNumWishesStream(true),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.shade200,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.docs.length.toString(),
                                        style: textStyle(
                                            22, Colors.white, FontWeight.w500),
                                      ),
                                    ),
                                  )
                                : const CircularProgressIndicator();
                          }),
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
                          itemCount: homeController.wishes.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WishItem(homeController.wishes[index]);
                          },
                        )
                      : ListView.builder(
                          itemCount: homeController.fulfilledwishes.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WishItem(
                                homeController.fulfilledwishes[index]);
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
