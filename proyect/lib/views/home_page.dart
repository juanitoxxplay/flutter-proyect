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
  late List<Auto> _autosFiltrados;
  final TextEditingController _searchController = TextEditingController();


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
    _autosFiltrados = List.from(_autos);
    _searchController.addListener(_filtrarAutos);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filtrarAutos);
    _searchController.dispose();
    super.dispose();
  }

  void _filtrarAutos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _autosFiltrados = List.from(_autos);
      } else {
        _autosFiltrados = _autos
            .where((auto) =>
                auto.description.toLowerCase().contains(query) ||
                auto.type.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _recargarAutos() {
    setState(() {
      _autos = autos;
      _autosFiltrados = List.from(_autos);
      _searchController.clear();
    });

  }

  void _toggleEstadoAuto(int index) {
    setState(() {

      final originalIndex = _autos.indexOf(_autosFiltrados[index]);
      _autos[originalIndex].isActive = !_autos[originalIndex].isActive;
      _filtrarAutos();

    });

   
  ApiService().updateEstado(_autos[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: FordTheme.fordBlue,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                Center(
                  child: Text(
                    'Autos Disponibles',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Barra de búsqueda
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.black87),
                    cursorColor: FordTheme.fordBlue,
                    decoration: InputDecoration(
                      hintText: 'Buscar autos...',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(Icons.search, color: FordTheme.fordBlue),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
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
      body: _autosFiltrados.isEmpty
          ? const Center(
              child: Text(
                'No hay autos disponibles',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              itemCount: _autosFiltrados.length,
              itemBuilder: (context, index) => AutoCard(
                auto: _autosFiltrados[index],
                onToggleEstado: () => _toggleEstadoAuto(index),
              ),
            ),
    );
  } 
}