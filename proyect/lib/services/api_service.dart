import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../models/auto_model.dart';

class ApiService {
  Future<List<Auto>> getAutos() async {
    final res = await http.get(Uri.parse('$apiBaseUrl/autos'));
    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.map((e) => Auto.fromJson(e)).toList();
    } else {
      throw Exception('Error cargando autos');
    }
  }

  Future<void> saveAuto(Auto auto) async {
    final res = await http.post(
      Uri.parse('$apiBaseUrl/autos'),
      body: json.encode(auto.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode != 200) {
      throw Exception('Error al guardar auto');
    }
  }
}
