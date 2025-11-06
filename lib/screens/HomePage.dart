import 'package:flutter/material.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/tab/dog_tab.dart';
import 'package:donut_app/tab/cat_tab.dart';
import 'package:donut_app/tab/bird_tab.dart';
import 'package:donut_app/tab/mouse_tab.dart';
import 'package:donut_app/tab/horse_tab.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:donut_app/pages/cart_page.dart'; // Nueva página

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png', label: 'Cat'),
    const MyTab(iconPath: 'lib/icons/burger.png', label: 'Dog'),
    const MyTab(iconPath: 'lib/icons/smoothie.png', label: 'Bird'),
    const MyTab(iconPath: 'lib/icons/pancakes.png', label: 'Horse'),
    const MyTab(iconPath: 'lib/icons/pizza.png', label: 'Mouse'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I want ', style: TextStyle(fontSize: 24)),
                  Text(
                    'a friend',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: myTabs,
              onTap: (_) {
                setState(() {}); // refresca el carrito cuando cambian las pestañas
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CatTab(),
                  DogTab(),
                  BirdTab(),
                  HorseTab(),
                  MouseTab(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Cart.itemCount} Items | \$${Cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Adopt !',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartPage()),
                      ).then((_) => setState(() {})); // refresca al volver
                    },
                    child: const Text(
                      'View Cart',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
