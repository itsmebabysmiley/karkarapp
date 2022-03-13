import 'package:flutter/material.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/providers/cart_provider.dart';
import 'package:karkarapp/components/remove_round_button.dart';
import 'package:karkarapp/screens/cart/components/counter_buttons.dart';
import 'package:provider/provider.dart';

import '../constaints.dart';

class CardItemMedium extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const CardItemMedium({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 40,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.9)),
              ],
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(product.image),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${product.name}\n".toUpperCase(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              TextSpan(
                                text: product.city.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${product.price.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: cFontColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardItemWide extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const CardItemWide({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: size.height * 0.17,
        width: size.width,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0.1),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.9)),
                ],
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      product.image,
                      height: 100,
                      width: 120,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${product.name}\n".toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextSpan(
                          text: "${product.city}\n".toUpperCase(),
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: cFontColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardForCartItem extends StatelessWidget {
  final Product product;
  //* if you want to make your card can tap, you can wrap the container with any detector you want.
  final VoidCallback onTap;

  const CardForCartItem({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: size.height * 0.17,
        width: size.width,
        padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0.1),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.9)),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 100,
              width: 120,
              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset(product.image),),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${product.name}\n".toUpperCase(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              TextSpan(
                                text: "${product.city}".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${product.price.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: cFontColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        CouterButton(
                          product: product,
                        ),
                        const Spacer(),
                        RemoveRoundButton(onTap: (){
                          context.read<ShoppingCart>().removeFromCart(product);
                        },)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




