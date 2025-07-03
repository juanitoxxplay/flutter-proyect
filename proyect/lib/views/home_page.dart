import 'package:flutter/material.dart';
import '../models/auto_model.dart';
import '../services/mock_autos.dart';
import '../widgets/auto_card.dart';
import 'form_page.dart';
import '../theme/theme.dart'; // 👈 importa tu paleta

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Auto> _autos;

  @override
  void initState() {
    super.initState();
    _autos = mockAutos;
  }

  void _recargarAutos() {
    setState(() {
      _autos = mockAutos;
    });
  }

  void _toggleEstadoAuto(int index) {
    setState(() {
      _autos[index].isActive = !_autos[index].isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Autos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FormPage()),
          );
          _recargarAutos();
        },
        child: const Icon(Icons.add),
      ),
      body: _autos.isEmpty
          ? const Center(
              child: Text(
                'No hay autos disponibles',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _autos.length,
              itemBuilder: (context, index) => AutoCard(
                auto: _autos[index],
                onToggleEstado: () => _toggleEstadoAuto(index),
              ),
            ),
    );
  }
}
