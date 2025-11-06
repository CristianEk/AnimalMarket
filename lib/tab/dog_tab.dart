import 'package:flutter/material.dart';
import 'package:donut_app/utils/dog_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class DogTab extends StatelessWidget {
  DogTab({super.key});

  // Lista de perros disponibles
  final List<List<dynamic>> dogOnSale = [
    [
      'Golden Retriever',
      2500.0,
      Colors.amber,
      'lib/images/golden_retriever.jpeg',
      'PetWorld',
    ],
    [
      'Bulldog Francés',
      2800.0,
      Colors.grey,
      'lib/images/french_bulldog.jpg',
      'PetWorld',
    ],
    [
      'Husky Siberiano',
      3000.0,
      Colors.lightBlue,
      'lib/images/husky.jpeg',
      'PetWorld',
    ],
    [
      'Chihuahua',
      1500.0,
      Colors.brown,
      'lib/images/chihuahua.jpg',
      'PetWorld',
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
          itemCount: dogOnSale.length,
          itemBuilder: (context, index) {
            final dog = dogOnSale[index];

            return DogTile(
              dogName: dog[0],
              dogPrice: dog[1].toString(),
              dogColor: dog[2],
              dogImagePath: dog[3],
              dogProvider: dog[4],
              // Función para agregar al carrito
              onAddToCart: () {
                final product = Product(
                  name: dog[0],
                  price: dog[1],
                  imagePath: dog[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${dog[0]} agregado al carrito'),
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
