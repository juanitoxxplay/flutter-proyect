import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'views/welcome_page.dart'; 

void main() => runApp(const MyApp());



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Autos',
      theme: FordTheme.lightTheme,
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
