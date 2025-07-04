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
        onTap: () {}, // Puedes añadir una acción al tocar la tarjeta
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: auto.isActive
                      ? Colors.green.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.directions_car,
                  color: auto.isActive ? Colors.green[800] : Colors.grey[700],
                  size: 28,
                ),
              ),

              const SizedBox(width: 16),

              // Información del auto
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
                          auto.type,
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
                  value: auto.isActive,
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
