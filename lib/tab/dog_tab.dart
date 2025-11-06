import 'package:flutter/material.dart';
import 'package:donut_app/utils/dog_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  // Lista de donas disponibles
  final List<List<dynamic>> donutOnSale = [
    [
      'Chocolate',
      100.0,
      Colors.brown,
      'lib/images/chocolate_donut.png',
      'Starbucks',
    ],
    [
      'Strawberry',
      100.0,
      Colors.pink,
      'lib/images/strawberry_donut.png',
      'Starbucks',
    ],
    [
      'Ice Cream',
      100.0,
      Colors.yellow,
      'lib/images/icecream_donut.png',
      'Starbucks',
    ],
    [
      'Grape',
      100.0,
      Colors.purple,
      'lib/images/grape_donut.png',
      'Starbucks',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ajuste de proporción dependiendo del ancho
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
          itemCount: donutOnSale.length,
          itemBuilder: (context, index) {
            final donut = donutOnSale[index];

            return DonutTile(
              donutFlavor: donut[0],
              donutPrice: donut[1].toString(),
              donutColor: donut[2],
              donutImagePath: donut[3],
              donutProvider: donut[4],
              // Función para agregar al carrito
              onAddToCart: () {
                final product = Product(
                  name: donut[0],
                  price: donut[1],
                  imagePath: donut[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${donut[0]} added to cart'),
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
