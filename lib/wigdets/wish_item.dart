import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/controller/home_controller.dart';
import 'package:tutorial_10/models/wish_model.dart';
import 'package:tutorial_10/utils.dart';

class WishItem extends StatelessWidget {
  final Wish wish;
  WishItem(this.wish);

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onDoubleTap: () => homeController.deleteWish(wish.id),
        child: ListTile(
          leading: Image(
            //image: NetworkImage('https://picsum.photos/200'),
            image: NetworkImage(wish.image),
            width: 60,
            fit: BoxFit.fill,
          ),
          title: Text(
            wish.wish,
            style: textStyle(18, Colors.black, FontWeight.w700),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '\$ ${wish.price}',
              style: textStyle(16, Colors.grey, FontWeight.w600),
            ),
          ),
          trailing: Checkbox(
            value: wish.fulfilled,
            onChanged: (value) => homeController.fullfillWish(value, wish.id),
          ),
        ),
      ),
    );
  }
}
