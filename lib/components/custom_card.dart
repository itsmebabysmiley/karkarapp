import 'package:flutter/material.dart';

import '../constaints.dart';

class CardItem extends StatelessWidget {
  final String imagePath, name, city;
  final double price;
  final VoidCallback onTap;
  const CardItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.city,
    required this.price,
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
                    child: Image.asset(imagePath),
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
                                text: "$name\n".toUpperCase(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              TextSpan(
                                text: "$city".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$$price',
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

class CardItem2 extends StatelessWidget {
  final String imagePath, name, city;
  final double price;
  final VoidCallback onTap;
  const CardItem2({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.city,
    required this.price,
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
                      imagePath,
                      height: 100,
                      width: 120,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$name\n".toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextSpan(
                          text: "$city\n".toUpperCase(),
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$$price',
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
