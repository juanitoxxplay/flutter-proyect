import 'package:flutter/material.dart';
import '../models/auto_model.dart';
import '../theme/theme.dart';
import '../views/AutoDetails.dart';

class AutoCard extends StatelessWidget {
  final Auto auto;
  final VoidCallback? onToggleEstado;
  final String? imageUrl;

  const AutoCard({
    super.key,
    required this.auto,
    this.onToggleEstado,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AutoDetailScreen(
                auto: auto,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: auto.isActive
                      ? FordTheme.activeGreenLight.withOpacity(0.3)
                      : theme.disabledColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.directions_car,
                  color: auto.isActive
                      ? FordTheme.activeGreen
                      : theme.disabledColor,
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
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.category, size: 14, color: theme.hintColor),
                        const SizedBox(width: 4),
                        Text(
                          auto.type,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.hintColor),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.people, size: 14, color: theme.hintColor),
                        const SizedBox(width: 4),
                        Text(
                          'Cap: ${auto.capacity}',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.hintColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${auto.price}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: FordTheme.fordBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Este GestureDetector evita que el onTap del InkWell se active al tocar el Switch
              GestureDetector(
                onTap: () {},
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Switch(
                    value: auto.isActive,
                    activeColor: FordTheme.activeGreen,
                    activeTrackColor: FordTheme.activeGreenLight,
                    inactiveThumbColor: theme.disabledColor,
                    inactiveTrackColor: theme.disabledColor.withOpacity(0.3),
                    onChanged: (_) => onToggleEstado?.call(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
