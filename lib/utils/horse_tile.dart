import 'package:flutter/material.dart';

class HorseTile extends StatelessWidget {
  final String horseName;
  final String horsePrice;
  final dynamic horseColor;
  final String horseImagePath;
  final String horseProvider;
  final VoidCallback? onAddToCart;

  const HorseTile({
    super.key,
    required this.horseName,
    required this.horsePrice,
    this.horseColor,
    required this.horseImagePath,
    required this.horseProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: (horseColor is MaterialColor)
              ? horseColor[50]
              : horseColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Precio en esquina superior derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (horseColor is MaterialColor)
                        ? horseColor[100]
                        : horseColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text(
                    '\$$horsePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: (horseColor is MaterialColor)
                          ? horseColor[800]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen del caballo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                horseImagePath,
                height: 100, // evita overflow
                fit: BoxFit.contain,
              ),
            ),

            // Nombre del caballo
            Text(
              horseName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Proveedor o criadero
            Text(horseProvider, style: TextStyle(color: Colors.grey[600])),

            // Parte inferior: icono favorito + botón Add
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  TextButton(
                    onPressed: onAddToCart,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
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
