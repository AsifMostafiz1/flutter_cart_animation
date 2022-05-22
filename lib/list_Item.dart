import 'package:flutter/material.dart';
import 'package:add_to_cart_animation/globalkeyext.dart';

class AppListItem extends StatelessWidget {
  final GlobalKey imageGlobalKey = GlobalKey();
  final int index;
  final void Function(GlobalKey) onClick;

  AppListItem({required this.onClick, required this.index});
  @override
  Widget build(BuildContext context) {
    // Improvement/Suggestion 3.1: Container is mandatory. It can hold images or whatever you want
    Container mandatoryContainer = Container(
        key: imageGlobalKey,
        width: 60,
        height: 120,
        color: Colors.transparent,
        child: Column(
          children: [
            Image.asset("assets/apple.png", width: 60, height: 60),
            Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            )
          ],
        ));

    return ListTile(
        onTap: () => onClick(imageGlobalKey),
        leading: mandatoryContainer,
        title: Text("Animated Apple $index"));
  }
}