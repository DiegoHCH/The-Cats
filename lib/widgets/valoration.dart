import 'package:flutter/material.dart';

class ValorationBar extends StatelessWidget {
  final int value;

  const ValorationBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    const maxValue = 5;
    return Row(
      children: List.generate(maxValue, (index) {
        if (index < value) {
          return const Icon(Icons.star, color: Colors.amber, size: 24);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 24);
        }
      }),
    );
  }
}