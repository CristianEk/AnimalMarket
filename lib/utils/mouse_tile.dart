import 'package:flutter/material.dart';

class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String smoothieImagePath;
  final String smoothieProvider;
  final VoidCallback? onAddToCart;

  const SmoothieTile({
    super.key,
    required this.smoothieFlavor,
    required this.smoothiePrice,
    this.smoothieColor,
    required this.smoothieImagePath,
    required this.smoothieProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: (smoothieColor is MaterialColor)
              ? smoothieColor[50]
              : smoothieColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (smoothieColor is MaterialColor)
                        ? smoothieColor[100]
                        : smoothieColor.withOpacity(0.3),
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
                    '\$$smoothiePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: (smoothieColor is MaterialColor)
                          ? smoothieColor[800]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // imagen ajustada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                smoothieImagePath,
                height: 100, // evita overflow
                fit: BoxFit.contain,
              ),
            ),

            // nombre
            Text(
              smoothieFlavor,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // proveedor
            Text(smoothieProvider, style: TextStyle(color: Colors.grey[600])),

            // botones
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
