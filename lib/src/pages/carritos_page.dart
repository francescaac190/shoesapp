import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  final itemsList = List<String>.generate(10, (n) => "List item ${n}");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Text('Carrito',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700)),
                  const Spacer(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBarConfig(),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemsList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(itemsList[index]),
                      background: slideLeftBackground(),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          final bool res = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  surfaceTintColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  content: Text(
                                      "Are you sure you want to delete ${itemsList[index]}?"), // Corrected string interpolation
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("Cancel"),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                    TextButton(
                                      child: Text("Delete",
                                          style: TextStyle(color: Colors.red)),
                                      onPressed: () {
                                        // Assuming 'itemsList' and 'index' are defined in your state
                                        setState(() {
                                          itemsList.removeAt(
                                              index); // Implement your deletion logic here
                                        });
                                        Navigator.of(context).pop(true);
                                      },
                                    ),
                                  ],
                                );
                              });
                          return res;
                        } else {
                          // Implement the else logic, e.g., navigate to edit page
                          return Future.value(false);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.asset('assets/imgs/amarillo.png'),
                          title: Text(
                            'Nike Air Max 720',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$180',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                              Text(
                                'Cantidad: 1',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  BottomAppBar BottomAppBarConfig(
      // String? monto, String? texto
      ) {
    return BottomAppBar(
        // notchMargin: 10,
        height: 80,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 10,
            left: 16,
            right: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$180',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                child: Text(
                  'Realizar Pedido',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ));
  }
}
