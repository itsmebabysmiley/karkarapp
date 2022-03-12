import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCartWithBuyButton extends StatelessWidget {
  final Product product;
  const AddToCartWithBuyButton({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _shoppingItems = context.watch<ShoppingCart>().cart;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 20,
            color: cPrimaryColor.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: cPrimary2Color),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  for (ProductInCart p in _shoppingItems) {
                    if (p.item.id == product.id) {
                      context.read<ShoppingCart>().increment(product);
                      return;
                    }
                  }
                  context.read<ShoppingCart>().addToCart(product);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_shopping_cart,
                        color: cPrimary2Color,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(color: cPrimary2Color),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              height: 50,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Buying not supported yet.')));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(cPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Buy Now'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
