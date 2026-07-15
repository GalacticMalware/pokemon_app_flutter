import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/color_const.dart';

class FeatureItemW extends StatelessWidget {
  const FeatureItemW(
      {super.key, this.icon, required this.value, required this.label});

  final IconData? icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: blackColor),
              const SizedBox(width: 5)
            ],
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: blackColor)),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
