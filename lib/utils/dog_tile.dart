import 'package:flutter/material.dart';

class DogTile extends StatelessWidget {
  final String dogName;
  final String dogPrice;
  final dynamic dogColor;
  final String dogImagePath;
  final String dogProvider;
  final VoidCallback? onAddToCart;

  const DogTile({
    super.key,
    required this.dogName,
    required this.dogPrice,
    this.dogColor,
    required this.dogImagePath,
    required this.dogProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: dogColor[50],
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          children: [
            // Precio en esquina superior derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: dogColor[100],
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
                    '\$$dogPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: dogColor[800],
                    ),
                  ),
                ),
              ],
            ),

            // Imagen del perro
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 12,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(dogImagePath, fit: BoxFit.contain),
                ),
              ),
            ),

            // Nombre del perro
            Text(
              dogName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Proveedor / tienda
            Text(dogProvider, style: TextStyle(color: Colors.grey[600])),

            // Icono favorito + botón "Add"
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
