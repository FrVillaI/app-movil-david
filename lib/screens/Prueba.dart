import 'package:app_pruba_06_06/screens/Contenidos.dart';
import 'package:app_pruba_06_06/screens/Ejercicio2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prueba",
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
        title: const Text('Prueba'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Nombre:"),
          const Text("Nombre: Villacis Isaac"),
          const Text("Usuario GitHub:"),
          const Text("Usuario GitHub: FrVillaI"),
          BotonActions(context),
          BotonContenidos(context)
        ],
      ));
}

Widget BotonActions(context) {
  return (ElevatedButton(
    onPressed: () {
      AlertaEjercicio2(context);
    },
    child: Text("Ejercicio 2"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    ),
  ));
}

void AlertaEjercicio2(context) {
  showDialog(
      context: context,
      builder: (context) {
        return (AlertDialog(
          title: Text("Ir al Ejericio 2"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ejercicio2()));
              },
              child: Text("OK"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"))
          ],
        ));
      });
}

Widget BotonContenidos(context) {
  return (ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Contenidos()),
      );
    },
    child: Text("Ejercicios"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    ),
  ));
}
