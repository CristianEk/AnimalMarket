import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String label;

  const MyTab({
    super.key,
    required this.iconPath,
    required this.label,
  }); //requiere del icono y la etoqueta (nombre de pestaña)

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //centra los elementos verticalmente
        children: [
          ClipRRect(
            //recorta la imagen en una forma redondeada
            borderRadius: BorderRadius.circular(16), //le da forma redondeada
            child: Container(
              padding: const EdgeInsets.all(8), //espacio interno
              color: Colors.grey[200], //fondo gris claro
              child: Image.asset(
                iconPath,
                color: Colors.grey[600],
                height: 40,
              ), //color del vector de la imagen y tamaño
            ),
          ),
          const SizedBox(height: 6), //espacio entre la imagen y el texto
          Text(
            label, //etiqueta de la pestaña
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700], //color del texto
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
