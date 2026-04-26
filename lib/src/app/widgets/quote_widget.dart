import 'package:animood/src/core/app_colors.dart';
import 'package:animood/src/core/app_extensions.dart';
import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    required this.quote,
    this.color = AppColors.text,
    super.key,
  });

  final String quote;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.withValues(
              alpha: 0.15,
            ),
            borderRadius: .circular(8),
          ),
          margin: const .symmetric(vertical: 12),
          padding: const .only(
            left: 12,
            right: 12,
            bottom: 12,
            top: 24,
          ),
          child: Text(
            quote,
            style: context.textTheme.titleLarge,
          ),
        ),
        Positioned(
          top: -12,
          left: -18,
          child: Icon(
            Icons.format_quote_outlined,
            size: 64,
            color: color,
          ),
        ),
      ],
    );
  }
}
