import 'package:flutter/material.dart';
import 'package:donut_app/utils/cat_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  // Lista de hamburguesas disponibles
  final List<List<dynamic>> burgersOnSale = [
    [
      'Cheese Burger',
      120.0,
      Colors.brown,
      'lib/images/cheese_burger.png',
      'McDonalds',
    ],
    [
      'Chicken Burger',
      110.0,
      Colors.orange,
      'lib/images/simple_burger.png',
      'KFC',
    ],
    [
      'Double Beef',
      150.0,
      Colors.red,
      'lib/images/tocino_burger.png',
      'Burger King',
    ],
    [
      'Veggie Burger',
      95.0,
      Colors.green,
      'lib/images/withfries_burger.png',
      'Subway',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mantiene el mismo estilo y proporciones
        final double aspectRatio =
            constraints.maxWidth < 400 ? 1 / 1.1 : 1 / 0.9;

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: aspectRatio,
          ),
          itemCount: burgersOnSale.length,
          itemBuilder: (context, index) {
            final burger = burgersOnSale[index];

            return BurgerTile(
              burgerName: burger[0],
              burgerPrice: burger[1].toString(),
              burgerColor: burger[2],
              burgerImagePath: burger[3],
              burgerProvider: burger[4],
              // para manejar el botón de agregar
              onAddToCart: () {
                final product = Product(
                  name: burger[0],
                  price: burger[1],
                  imagePath: burger[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${burger[0]} added to cart'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
