import 'package:flutter/material.dart';

import '../../../constaints.dart';

class PriceWithFavIcon extends StatelessWidget {
  final double price;
  const PriceWithFavIcon({
    Key? key, required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                  text: '\$ ',
                  style: TextStyle(
                    color: cFontColor,
                    fontSize: 20,
                  )),
              TextSpan(
                text: '$price',
                style: const TextStyle(
                    color: cFontColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}