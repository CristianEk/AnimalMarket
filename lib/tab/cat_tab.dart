import 'package:flutter/material.dart';
import 'package:donut_app/utils/cat_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class CatTab extends StatelessWidget {
  CatTab({super.key});

  // Lista de gatos disponibles
  final List<List<dynamic>> catsOnSale = [
    [
      'Persa',
      2500.0,
      Colors.orange,
      'lib/images/persa.jpg',
      'Cat Lovers PetShop',
    ],
    [
      'Siames',
      2200.0,
      Colors.brown,
      'lib/images/siames.jpg',
      'Paw Friends',
    ],
    [
      'Bengala',
      2800.0,
      Colors.yellow,
      'lib/images/bengala.jpeg',
      'Happy Pets',
    ],
    [
      'Esfinge',
      3000.0,
      Colors.purple,
      'lib/images/esfinge.jpeg',
      'Exotic Cats MX',
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
          itemCount: catsOnSale.length,
          itemBuilder: (context, index) {
            final cat = catsOnSale[index];

            return CatTile(
              catName: cat[0],
              catPrice: cat[1].toString(),
              catColor: cat[2],
              catImagePath: cat[3],
              catProvider: cat[4],
              // para manejar el botón de agregar
              onAddToCart: () {
                final product = Product(
                  name: cat[0],
                  price: cat[1],
                  imagePath: cat[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${cat[0]} added to cart'),
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
