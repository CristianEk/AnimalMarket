import 'package:flutter/material.dart';
import 'package:donut_app/utils/mouse_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  // Lista de smoothies disponibles
  final List<List<dynamic>> smoothieOnSale = [
    [
      'Strawberry',
      100.0,
      Colors.pink,
      'lib/images/stawsmooth.png',
      'SuperSmoothie',
    ],
    [
      'Mango',
      90.0,
      Colors.orange,
      'lib/images/mango.png',
      'Smoothie King',
    ],
    [
      'Banana',
      95.0,
      Colors.yellow,
      'lib/images/banana.png',
      'Tropical Smoothie Cafe',
    ],
    [
      'Grapes',
      100.0,
      Colors.purple,
      'lib/images/grapes.png',
      'Healthy Smoothies',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ajuste de proporción según tamaño de pantalla
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
          itemCount: smoothieOnSale.length,
          itemBuilder: (context, index) {
            final smoothie = smoothieOnSale[index];

            return SmoothieTile(
              smoothieFlavor: smoothie[0],
              smoothiePrice: smoothie[1].toString(),
              smoothieColor: smoothie[2],
              smoothieImagePath: smoothie[3],
              smoothieProvider: smoothie[4],
              // Función para agregar al carrito
              onAddToCart: () {
                final product = Product(
                  name: smoothie[0],
                  price: smoothie[1],
                  imagePath: smoothie[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${smoothie[0]} added to cart'),
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
