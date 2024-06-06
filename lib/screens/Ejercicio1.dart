import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio1());
}

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejericio 1",
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
        title: const Text('Ejercicio 1'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img1.jpg"),
          fit: BoxFit.cover)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Pruebas de velocidad de los vehículos "),
          VelocidadInicialField(),
          VelocidadFinalField(),
          BotonCalularP(context)
        ],
      ));
}

Widget VelocidadInicialField() {
  return TextFormField(
    controller: _velocidadInicialController,
    decoration: const InputDecoration(
      hintText: 'Ingrese la Velocidad Inicial',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese la Velocidad Inicial';
      }
      return null;
    },
  );
}

final TextEditingController _velocidadInicialController =
    TextEditingController();

Widget VelocidadFinalField() {
  return TextFormField(
    controller: _velocidadFinalController,
    decoration: const InputDecoration(
      hintText: 'Ingrese la Velocidad Final',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese la Velocidad Final';
      }
      return null;
    },
  );
}

final TextEditingController _velocidadFinalController = TextEditingController();

Widget BotonCalularP(context) {
  return (ElevatedButton(
    onPressed: () {
      AlertaEjercicio2(context);
    },
    child: Text("Calcular el tiempo del auto"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    ),
  ));
}

double Calcular() {
  double velocidadInicial = double.parse(_velocidadInicialController.text);
  double velocidadFinal = double.parse(_velocidadFinalController.text);
  double aceleracion = 10;
  double tiempo = (velocidadFinal - velocidadInicial) / aceleracion;
  return tiempo;
}

void AlertaEjercicio2(context) {
  double timepoMinimo = 10;
  double timepoAutoPrueba = Calcular();
  if (timepoAutoPrueba < timepoMinimo) {
    showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: Text("El vehiculo reprobo la prueba con $timepoAutoPrueba segundos " ),
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
  else if (timepoAutoPrueba>timepoMinimo){
showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: Text("El vehiculo aprobo la prueba con $timepoAutoPrueba segundos"),
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
}
