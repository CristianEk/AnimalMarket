import 'package:flutter/material.dart';

class PancakeTile extends StatelessWidget {
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String pancakeImagePath;
  final String pancakeProvider;
  final VoidCallback? onAddToCart;

  const PancakeTile({
    super.key,
    required this.pancakeFlavor,
    required this.pancakePrice,
    this.pancakeColor,
    required this.pancakeImagePath,
    required this.pancakeProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: (pancakeColor is MaterialColor)
              ? pancakeColor[50]
              : pancakeColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (pancakeColor is MaterialColor)
                        ? pancakeColor[100]
                        : pancakeColor.withOpacity(0.3),
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
                    '\$$pancakePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: (pancakeColor is MaterialColor)
                          ? pancakeColor[800]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen del pancake
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                pancakeImagePath,
                height: 100, // evita overflow
                fit: BoxFit.contain,
              ),
            ),

            // Nombre del pancake
            Text(
              pancakeFlavor,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Proveedor
            Text(pancakeProvider, style: TextStyle(color: Colors.grey[600])),

            // Botones
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
