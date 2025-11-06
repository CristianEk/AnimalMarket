import 'package:flutter/material.dart';

class MouseTile extends StatelessWidget {
  final String mouseName;
  final String mousePrice;
  final dynamic mouseColor;
  final String mouseImagePath;
  final String mouseProvider;
  final VoidCallback? onAddToCart;

  const MouseTile({
    super.key,
    required this.mouseName,
    required this.mousePrice,
    this.mouseColor,
    required this.mouseImagePath,
    required this.mouseProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: (mouseColor is MaterialColor)
              ? mouseColor[50]
              : mouseColor,
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
                    color: (mouseColor is MaterialColor)
                        ? mouseColor[100]
                        : mouseColor.withOpacity(0.3),
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
                    '\$$mousePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: (mouseColor is MaterialColor)
                          ? mouseColor[800]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                mouseImagePath,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),

            // Nombre del ratón
            Text(
              mouseName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Raza o tipo
            Text(
              mouseProvider,
              style: TextStyle(color: Colors.grey[600]),
            ),

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
                      'Adopt',
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
