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
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          Icons.directions_car,
          color: auto.isActive ? Colors.green : Colors.grey,
          size: 30,
        ),
        title: Text(
          auto.description,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${auto.type} • Cap: ${auto.capacity}'),
            Text('\$${auto.price}', style: const TextStyle(color: Colors.black87)),
          ],
        ),
        trailing: Switch(
          value: auto.isActive,
          onChanged: (_) => onToggleEstado?.call(),
        ),
      ),
    );
  }
}
