import 'package:flutter/material.dart';
import 'package:donut_app/utils/horse_tile.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class HorseTab extends StatelessWidget {
  HorseTab({super.key});

  // Lista de caballos disponibles
  final List<List<dynamic>> horsesOnSale = [
    [
      'Caballo Árabe',
      5000.0,
      Colors.brown,
      'lib/images/horse_arabe.jpg',
      'Rancho Los Potros',
    ],
    [
      'Caballo Frisón',
      7000.0,
      Colors.black,
      'lib/images/horse_frisian.jpg',
      'EquiWorld',
    ],
    [
      'Caballo Mustang',
      6000.0,
      Colors.grey,
      'lib/images/horse_mustang.jpg',
      'Wild Riders',
    ],
    [
      'Caballo Pura Sangre',
      8000.0,
      Colors.blueGrey,
      'lib/images/horse_purasangre.jpeg',
      'Elite Horses',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ajuste de proporción según el ancho de pantalla
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
          itemCount: horsesOnSale.length,
          itemBuilder: (context, index) {
            final horse = horsesOnSale[index];

            return HorseTile(
              horseName: horse[0],
              horsePrice: horse[1].toString(),
              horseColor: horse[2],
              horseImagePath: horse[3],
              horseProvider: horse[4],
              // Función para agregar al carrito
              onAddToCart: () {
                final product = Product(
                  name: horse[0],
                  price: horse[1],
                  imagePath: horse[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${horse[0]} agregado al carrito'),
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

