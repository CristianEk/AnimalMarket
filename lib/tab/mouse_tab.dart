import 'package:donut_app/utils/mouse_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class MouseTab extends StatelessWidget {
  MouseTab({super.key});

  // Lista de ratones disponibles
  final List<List<dynamic>> mouseOnSale = [
    // nombre, precio, color, imagen, proveedor
    ['Ratón Blanco', 50.0, Colors.grey, 'lib/images/mouse_white.jpg', 'PetLovers'],
    ['Ratón Doméstico', 45.0, Colors.brown, 'lib/images/mouse_brown.jpg', 'TinyPets'],
    ['Ratón Albino', 60.0, Colors.pink, 'lib/images/mouse_albino.jpg', 'HappyMice'],
    ['Ratón de Laboratorio', 70.0, Colors.blueGrey, 'lib/images/mouse_lab.jpg', 'BioPets'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Diseño del grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.45,
      ),
      itemCount: mouseOnSale.length,
      itemBuilder: (context, index) {
        final mouse = mouseOnSale[index];

        return MouseTile(
          mouseName: mouse[0],
          mousePrice: mouse[1].toString(),
          mouseColor: mouse[2],
          mouseImagePath: mouse[3],
          mouseProvider: mouse[4],
          onAddToCart: () {
            final product = Product(
              name: mouse[0],
              price: mouse[1],
              imagePath: mouse[3],
            );

            Cart.addItem(product);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${mouse[0]} added to cart'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}
