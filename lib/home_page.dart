import 'package:flutter/material.dart';
import 'package:flutter_cart_animation/list_Item.dart';

import 'add_to_cart_animation.dart';
import 'add_to_cart_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  var _cartQuantityItems = 0;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      gkCart: gkCart,
      rotation: true,
      dragToCardCurve: Curves.easeIn,
      dragToCardDuration: const Duration(milliseconds: 500),
      previewCurve: Curves.linearToEaseOut,
      previewDuration: const Duration(milliseconds: 10),
      previewHeight: 30,
      previewWidth: 30,
      opacity: 0.85,
      initiaJump: false,
      receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
        // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCardAnimation = addToCardAnimationMethod;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("widget.title"),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.cleaning_services),
              onPressed: () {
                _cartQuantityItems = 0;
                gkCart.currentState!.runClearCartAnimation();
              },
            ),
            const SizedBox(width: 16),
            AddToCartIcon(
              key: gkCart,
              icon: const Icon(Icons.shopping_cart),
              colorBadge: Colors.red,
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: ListView(
          children: [
            AppListItem(onClick: listClick, index: 1),
            AppListItem(onClick: listClick, index: 2),
            AppListItem(onClick: listClick, index: 3),
            AppListItem(onClick: listClick, index: 4),
            AppListItem(onClick: listClick, index: 5),
            AppListItem(onClick: listClick, index: 6),
            AppListItem(onClick: listClick, index: 7),
            AppListItem(onClick: listClick, index: 1),
            AppListItem(onClick: listClick, index: 2),
            AppListItem(onClick: listClick, index: 3),
            AppListItem(onClick: listClick, index: 4),
            AppListItem(onClick: listClick, index: 5),
            AppListItem(onClick: listClick, index: 6),
            AppListItem(onClick: listClick, index: 7),
          ],
        ),
      ),
    );
  }

  void listClick(GlobalKey gkImageContainer) async {
    await runAddToCardAnimation(gkImageContainer);
    await gkCart.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }
}
