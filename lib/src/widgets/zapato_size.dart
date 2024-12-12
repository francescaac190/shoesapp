import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({Key? key, this.fullScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? MediaQuery.of(context).size.height * 0.5 : 410,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: fullScreen
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: <Widget>[
              const _ZapatoConSombra(),
              if (!fullScreen) const _ZapatoTalla(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTalla extends StatelessWidget {
  const _ZapatoTalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _CajaTalla(7),
          _CajaTalla(7.5),
          _CajaTalla(8),
          _CajaTalla(8.5),
          _CajaTalla(9),
          _CajaTalla(9.5),
        ],
      ),
    );
  }
}

class _CajaTalla extends StatelessWidget {
  final double numero;

  const _CajaTalla(this.numero, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (numero == zapatoModel.talla)
              ? const Color(0xffF1A23A)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == zapatoModel.talla)
              const BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              )
          ],
        ),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: (numero == zapatoModel.talla)
                ? Colors.white
                : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[
          const Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ],
        ),
      ),
    );
  }
}
