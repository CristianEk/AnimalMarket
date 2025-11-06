import 'package:flutter/material.dart';
import 'package:donut_app/utils/horse_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class PancakeTab extends StatelessWidget {
  PancakeTab({super.key});

  // Lista de pancakes disponibles
  final List<List<dynamic>> pancakesOnSale = [
    [
      'Arándano',
      80.0,
      Colors.brown,
      'lib/images/arandanos.png',
      'Pancake House',
    ],
    [
      'Clásico',
      90.0,
      Colors.deepOrange,
      'lib/images/clasic.png',
      'Sweet Stack',
    ],
    [
      'Mantequilla',
      95.0,
      Colors.yellow,
      'lib/images/mantequilla.png',
      'Breakfast & Co.',
    ],
    [
      'Strawberry',
      100.0,
      Colors.purple,
      'lib/images/stawberry_pancake.png',
      'Morning Joy',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ajuste de proporción según el ancho del dispositivo
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
          itemCount: pancakesOnSale.length,
          itemBuilder: (context, index) {
            final pancake = pancakesOnSale[index];

            return PancakeTile(
              pancakeFlavor: pancake[0],
              pancakePrice: pancake[1].toString(),
              pancakeColor: pancake[2],
              pancakeImagePath: pancake[3],
              pancakeProvider: pancake[4],
              // Función para agregar al carrito
              onAddToCart: () {
                final product = Product(
                  name: pancake[0],
                  price: pancake[1],
                  imagePath: pancake[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${pancake[0]} added to cart'),
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
