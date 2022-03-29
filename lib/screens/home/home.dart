import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karkarapp/components/custom_bold_underline_text.dart';
import 'package:karkarapp/components/custom_card.dart';
import 'package:karkarapp/components/header_with_searchbar.dart';
import 'package:karkarapp/constaints.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/screens/cart/cart.dart';
import 'package:karkarapp/screens/details_screen/detail.dart';
import 'package:karkarapp/screens/more/more.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
 


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
   static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CartScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cPrimaryColor,
          automaticallyImplyLeading: false,
          shadowColor: cPrimaryColor,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: cPrimaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  const HomeScreen(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final User user = FirebaseAuth.instance.currentUser!;
    print(user);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeaderWithSearchBar(
            displayName: user.displayName?? '',photoURL: user.photoURL ,
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomHeadline(title: 'Recommended'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  recommendProducts.length,
                  (index) => CardItemMedium(
                      product: recommendProducts[index],
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              product: recommendProducts[index],
                            ),
                          )))),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomHeadline(title: 'You may like'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                recommendProducts.length,
                (index) => CardItemMedium(
                  product: mayLike[index],
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: mayLike[index],
                        ),
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomHeadline(title: 'For you'),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                forYou.length,
                (index) => CardItemWide(
                  product: forYou[index],
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(product: forYou[index]),
                      ),
                    ),
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
