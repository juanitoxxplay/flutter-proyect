import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../models/auto_model.dart';

class ApiService {
 static Future<List<Auto>> getAutos() async {
    final res = await http.get(Uri.parse('$apiBaseUrl/vehicles'));
    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.map((e) => Auto.fromJson(e)).toList();
    } else {
      throw Exception('Error cargando autos');
    }
  }

 Future<void> saveAuto(Auto auto) async {
  final url = Uri.parse('$apiBaseUrl/vehicles');

  final res = await http.post(
    url,
    body: json.encode(auto.toJson()),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json', // ← importante para evitar HTML o redirección
    },
  );

  if (res.statusCode == 200 || res.statusCode == 201) {
    // OK o creado con éxito
    return;
  } else if (res.statusCode == 302) {
    throw Exception('Redirección detectada. Verifica si estás autenticado o usando HTTPS.');
  } else {
    print('Respuesta del servidor: ${res.statusCode} - ${res.body}');
    throw Exception('Error al guardar auto');
  }
}
  Future<void> updateEstado(Auto auto) async {
      final url = Uri.parse('$apiBaseUrl/vehicles/${auto.codauto}');
  
      final res = await http.put(
        url,
        body: json.encode({'is_active': auto.isActive}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
  
      if (res.statusCode != 200) {
        throw Exception('Error al actualizar estado del auto');
      }
    }

  Future<void> deleteAuto(String codauto) async {
    final url = Uri.parse('$apiBaseUrl/vehicles/$codauto');

    final res = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (res.statusCode != 200) {
      throw Exception('Error al eliminar auto');
    }
  }
}
