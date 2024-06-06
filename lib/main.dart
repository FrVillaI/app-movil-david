import 'package:flutter/material.dart';


void main(){
  return(runApp(Prueba()));
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Prueba(),
    );
  }
}

