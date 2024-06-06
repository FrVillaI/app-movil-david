import 'package:app_pruba_06_06/screens/Ejercicio1.dart';
import 'package:app_pruba_06_06/screens/Ejercicio2.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Contenidos());
}

class Contenidos extends StatelessWidget {
  const Contenidos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int indice=0;
  @override
  Widget build(BuildContext context) {
    /////////////////////////////////
    List <Widget> screens =[
      Ejercicio1(),
      Ejercicio2(),
    ];
    //////////////////////////////
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contenidos"),
      ),
      body:  screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: ( valor ) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ejercicio 01"),
          BottomNavigationBarItem(icon: Icon(Icons.no_drinks), label: "Ejercicio 02"),
        ],
        ),
    );
  }
}
