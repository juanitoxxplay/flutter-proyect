import 'package:flutter/material.dart';
import '../models/auto_model.dart';
import '../services/api_service.dart';
import '../widgets/form_fields.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _codautoCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _brandCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _capacityCtrl = TextEditingController();

  String _selectedType = 'Sedan';
  bool _isActive = true;

  final List<String> _tipos = [
    'Sedan',
    'Camioneta',
    'Deportivo',
    'Diesel',
    '350'
  ];

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final auto = Auto(
        codauto: _codautoCtrl.text,
        description: _descCtrl.text,
        codBrand: _brandCtrl.text,
        price: double.tryParse(_priceCtrl.text) ?? 0,
        capacity: int.tryParse(_capacityCtrl.text) ?? 0,
        type: _selectedType,
        isActive: _isActive,
      );

      ApiService().saveAuto(auto).then((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  void dispose() {
    _codautoCtrl.dispose();
    _descCtrl.dispose();
    _brandCtrl.dispose();
    _priceCtrl.dispose();
    _capacityCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Auto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextField(
                    label: 'Código del Auto',
                    controller: _codautoCtrl,
                    icon: Icons.confirmation_number,
                  ),
                  const SizedBox(height: 12),
                  buildTextField(
                    label: 'Descripción',
                    controller: _descCtrl,
                    icon: Icons.description,
                  ),
                  const SizedBox(height: 12),
                  buildTextField(
                    label: 'Código Marca',
                    controller: _brandCtrl,
                    icon: Icons.branding_watermark,
                  ),
                  const SizedBox(height: 12),
                  buildTextField(
                    label: 'Precio',
                    controller: _priceCtrl,
                    icon: Icons.attach_money,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  buildTextField(
                    label: 'Capacidad',
                    controller: _capacityCtrl,
                    icon: Icons.event_seat,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Vehículo',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.car_rental),
                    ),
                    value: _selectedType,
                    items: _tipos
                        .map((tipo) => DropdownMenuItem(
                              value: tipo,
                              child: Text(tipo),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      _selectedType = value!;
                    }),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    title: const Text('¿Está Activo?'),
                    value: _isActive,
                    onChanged: (val) => setState(() => _isActive = val),
                    secondary: Icon(_isActive ? Icons.check_circle : Icons.cancel),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar Auto'),
                    onPressed: _guardar,
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
