import 'package:flutter/material.dart';
import 'package:tutorial_10/utils.dart';

class WishItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: const Image(
          image: NetworkImage('https://picsum.photos/200'),
          width: 60,
          fit: BoxFit.fill,
        ),
        title: Text(
          'Random Wish',
          style: textStyle(18, Colors.black, FontWeight.w700),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            '\$500',
            style: textStyle(16, Colors.grey, FontWeight.w600),
          ),
        ),
        trailing: Checkbox(value: false, onChanged: (value) {}),
      ),
    );
  }
}
