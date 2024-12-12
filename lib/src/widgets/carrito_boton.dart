import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class AgregarCarritoBotone extends StatelessWidget {
  final double monto;

  const AgregarCarritoBotone({super.key, required this.monto});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              '\$$monto',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const BotonNaranja(texto: 'Add to cart'),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
