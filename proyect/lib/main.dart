import 'package:flutter/material.dart';
import 'theme/theme.dart'; // Importa tu paleta personalizada
import 'views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Autos',
      theme: FordTheme.lightTheme, // Aplica el tema global
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
