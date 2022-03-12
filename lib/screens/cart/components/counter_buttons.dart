import 'package:flutter/material.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CouterButton extends StatelessWidget {
  final Product product;
  const CouterButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _shoppingItems = context.watch<ShoppingCart>().cart;
    int finIndexOfProduct() {
      for (var i = 0; i < _shoppingItems.length; i++) {
        if (product.id == _shoppingItems[i].item.id) {
          return i;
        }
      }
      return 0;
    };
    int indexOfProduct = finIndexOfProduct();
    return Row(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<ShoppingCart>().decrement(product);
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
              '${context.watch<ShoppingCart>().cart[indexOfProduct].amount}'),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<ShoppingCart>().increment(product);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
