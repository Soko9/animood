import 'package:animood/src/app/models/spirit.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart' show Iconify;

class SpiritWidget extends StatelessWidget {
  const SpiritWidget({
    required this.spirit,
    super.key,
  });

  final Spirit spirit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Iconify(
          spirit.icon,
          color: spirit.color,
          size: 120,
        ),
        Text(
          spirit.name,
          textAlign: .center,
          style: textTheme.displayMedium?.copyWith(color: spirit.color),
        ),
        Text(
          spirit.description,
          textAlign: .center,
          style: textTheme.titleSmall,
        ),
      ],
    );
  }
}
