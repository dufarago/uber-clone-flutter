import 'package:flutter/material.dart';
import 'package:uber_app/screens/tela_inicial.dart';
import 'screens/tela_escolher_viagem.dart'; 

void main() {
  runApp(const UberApp());
}

class UberApp extends StatelessWidget {
  const UberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      home: const TelaEscolherViagem(), 
    );
  }
}