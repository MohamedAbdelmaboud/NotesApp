import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.isActive,
  });
  final Color color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: color, radius: 22, child: const Icon(Icons.check))
        : CircleAvatar(backgroundColor: color, radius: 22);
  }
}
