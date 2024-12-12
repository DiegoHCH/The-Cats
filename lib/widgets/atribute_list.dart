import 'package:flutter/material.dart';
import 'package:the_cats/widgets/valoration.dart';

class AttributesList extends StatelessWidget {
  final Map<String, int?> attributes;

  const AttributesList({super.key, required this.attributes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.entries.map((entry) {
        final title = entry.key;
        final value = entry.value ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              ValorationBar(value: value),
            ],
          ),
        );
      }).toList(),
    );
  }
}