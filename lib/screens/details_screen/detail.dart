import 'package:flutter/material.dart';
import 'package:karkarapp/components/custom_bold_underline_text.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/screens/details_screen/components/bottom_navbar.dart';
import 'package:karkarapp/screens/details_screen/components/description.dart';
import 'package:karkarapp/screens/details_screen/components/image.dart';

import '../../constaints.dart';
import 'components/price_with_favicon.dart';
import 'components/product_name.dart';
import 'components/reviews.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cPrimaryColor,
          shadowColor: cPrimaryColor,
          title: Text('Detail'.toUpperCase()),
          centerTitle: true,
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageDetail(imagePath: product.image),
              Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PriceWithFavIcon(price: product.price),
                          ProductName(name: product.name),
                          Description(
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus.",
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 10),
                                      color: Colors.grey,
                                      blurRadius: 30,
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const CustomBUText(text: 'Reviews'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                   Reviews(name: 'itsmebabysmiley',message: 'Very good quantity!', rating: 5,),
                                   Reviews(name: 'Jan Sadai',message: 'kawpao aroi', rating: 3,),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


