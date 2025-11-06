import 'package:flutter/material.dart';

class CatTile extends StatelessWidget {
  final String catName;
  final String catPrice;
  final Color catColor;
  final String catImagePath;
  final String catProvider;
  final VoidCallback? onAddToCart;

  const CatTile({
    super.key,
    required this.catName,
    required this.catPrice,
    required this.catColor,
    required this.catImagePath,
    required this.catProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: catColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Precio en esquina superior derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: catColor.withOpacity(0.2),
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
                    '\$$catPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: catColor,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen centrada y responsiva
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(catImagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            // Nombre del gato
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                catName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Proveedor
            Text(
              catProvider,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),

            // Parte inferior (corazón + botón Add)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  TextButton(
                    onPressed: onAddToCart,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink[600],
                    ),
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
