import 'package:donut_app/utils/bird_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/models/cart.dart';
import 'package:donut_app/models/product.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});

  final List pizzaOnSale = [
    //pizzaFlavor, pizzaPrice, pizzaColor, pizzaImagePath, pizzaProvider
    ['Cheese', 100.0, Colors.brown, 'lib/images/queso.png', 'SuperPizza'],
    ['Peperoni', 100.0, Colors.pink, 'lib/images/peperoni.png', 'Pizza Hut'],
    ['Mushroom', 100.0, Colors.yellow, 'lib/images/hongos.png', 'Dominos'],
    ['Hawaiana', 100.0, Colors.purple, 'lib/images/hawaiana.png', 'Little Caesars']
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      ///Se encarga de acomodar elementos dentro del grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.45, //relacion de aspecto ancho/alto
      ), //crossAxisCount numeros de columnas

      //lo que se construye en el grid (contenido)
      itemCount: pizzaOnSale.length, //cuantos elementos tendra
      itemBuilder: (context, index) {
        final pizza = pizzaOnSale[index];

        return PizzaTile(
          pizzaFlavor: pizza[0],
          pizzaPrice: pizza[1].toString(),
          pizzaColor: pizza[2],
          pizzaImagePath: pizza[3],
          pizzaProvider: pizza[4],
          onAddToCart: () {
            final product = Product(
              name: pizza[0],
              price: pizza[1],
              imagePath: pizza[3],
            );

            Cart.addItem(product);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${pizza[0]} added to cart'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}