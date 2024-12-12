import 'package:flutter/material.dart';
import 'package:shoesapp/src/pages/carritos_page.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color color;
  const BotonNaranja(
      {super.key,
      required this.texto,
      this.alto = 50,
      this.ancho = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const CarritoPage(),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: ancho,
        height: alto,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
