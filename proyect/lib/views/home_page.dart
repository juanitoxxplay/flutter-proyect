import 'package:flutter/material.dart';
import '../models/auto_model.dart';
import '../services/api_service.dart';
import '../widgets/auto_card.dart';
import 'form_page.dart';
import '../theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Auto> _autos = [];

  @override
  void initState() {
    super.initState();
    _fetchAutos();
  }

  Future<void> _fetchAutos() async {
    try {
      final autos = await ApiService.getAutos();
      setState(() {
        _autos = autos;
      });
    } catch (e) {
      print('Error al obtener autos: $e');
      setState(() {
        _autos = [];
      });
    }
  }

  void _toggleEstadoAuto(int index) {
    setState(() {
      _autos[index].isActive = _autos[index].isActive == 1 ? 0 : 1;
    });

    // Opcional: puedes enviar el cambio a la API si así lo deseas
    // ApiService().updateEstado(_autos[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Autos'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FormPage()),
          );
          await _fetchAutos();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
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