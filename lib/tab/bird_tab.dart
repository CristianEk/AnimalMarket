import 'package:flutter/material.dart';
import 'package:donut_app/utils/bird_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class BirdTab extends StatelessWidget {
  BirdTab({super.key});

  // Lista de aves disponibles en venta
  final List<List<dynamic>> birdsOnSale = [
    [
      'Canario',
      250.0,
      Colors.yellow,
      'lib/images/canary.jpeg',
      'Happy Wings',
    ],
    [
      'Perico',
      300.0,
      Colors.green,
      'lib/images/parrot.jpeg',
      'Tropical Pets',
    ],
    [
      'Cotorra',
      280.0,
      Colors.blue,
      'lib/images/cotorra.jpeg',
      'Feather Friends',
    ],
    [
      'Loro Amazónico',
      500.0,
      Colors.red,
      'lib/images/amazon_parrot.jpg',
      'Exotic Birds',
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
          itemCount: birdsOnSale.length,
          itemBuilder: (context, index) {
            final bird = birdsOnSale[index];

            return BirdTile(
              birdName: bird[0],
              birdPrice: bird[1].toString(),
              birdColor: bird[2],
              birdImagePath: bird[3],
              birdProvider: bird[4],
              // Función para agregar al carrito
              onAddToCart: () {
                final product = Product(
                  name: bird[0],
                  price: bird[1],
                  imagePath: bird[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${bird[0]} added to cart'),
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
