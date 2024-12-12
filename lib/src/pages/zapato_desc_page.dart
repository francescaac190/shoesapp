import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/carritos_page.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            const Hero(
                tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
                top: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon(Icons.chevron_left,
                      color: Colors.white, size: 60),
                ))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ZapatoDescripcion(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              SizedBox(
                height: 16,
              ),
              _ColoresYmas(),
              _BotonesLikeCartSettings()
            ],
          ),
        ))
      ],
    ));
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const _BotonSombreado(Icon(
            Icons.star,
            color: Colors.red,
            size: 25,
          )),
          _BotonSombreado(Icon(
            Icons.add_shopping_cart,
            color: Colors.green,
            size: 25,
          )),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado(
    this.icon,
  );

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
        width: 55,
        height: 55,
        //color: Colors.red,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ],
        ),
        child: icon,
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                    left: 90,
                    child: _BotonColor(
                        Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(
                    left: 60,
                    child: _BotonColor(
                        Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(
                    left: 30,
                    child: _BotonColor(
                        Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),
          //Spacer(),
          BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;
  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
