import 'package:flutter/material.dart';
import '../models/auto_model.dart';

class AutoCard extends StatelessWidget {
  final Auto auto;
  final VoidCallback? onToggleEstado;

  const AutoCard({
    super.key,
    required this.auto,
    this.onToggleEstado,
  });

  String getTipoNombre(int idtype) {
    switch (idtype) {
      case 1:
        return 'Sedán';
      case 2:
        return 'Pickup';
      case 3:
        return 'SUV';
      case 4:
        return 'Hatchback';
      case 5:
        return 'Convertible';
      case 6:
        return 'Van';
      default:
        return 'Otro';
    }
  }

  bool get estaActivo => auto.isActive == 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: estaActivo
                      ? Colors.green.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.directions_car,
                  color: estaActivo ? Colors.green[800] : Colors.grey[700],
                  size: 28,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      auto.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.category, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          getTipoNombre(auto.idtype),
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.people, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          'Cap: ${auto.capacity}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${auto.price}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Switch(
                  value: estaActivo,
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green[200],
                  inactiveThumbColor: Colors.grey[600],
                  inactiveTrackColor: Colors.grey[300],
                  onChanged: (_) => onToggleEstado?.call(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}