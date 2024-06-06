import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio2());
}

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejericio 2",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img2.jpg"),
          fit: BoxFit.cover)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Calcular la presion a la que es somito un submarino"),
          AlturaField(),
          BotonCalularP(context)
        ],
      ));
}

Widget AlturaField() {
  return TextFormField(
    controller: _alturaController,
    decoration: const InputDecoration(
      hintText: 'Ingrese la Altura del Submarino',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese el valor de la Altura';
      }
      return null;
    },
  );
}

final TextEditingController _alturaController = TextEditingController();

Widget BotonCalularP(context) {
  return (ElevatedButton(
    onPressed: () {
      AlertaEjercicio2(context);
    },
    child: Text("Calcular la presion"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    ),
  ));
}

double Calcular() {
  double altura = double.parse(_alturaController.text);
  double densidad_agua = 1025;
  double grevedad = 9.8;
  double presion = densidad_agua * grevedad * altura;
  return presion;
}

void AlertaEjercicio2(context) {
  double presion=  Calcular();
  showDialog(
      context: context,
      builder: (context) {
        return (AlertDialog(
          title: Text("$presion"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        ));
      });
}
