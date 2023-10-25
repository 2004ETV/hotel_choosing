import 'package:flutter/material.dart';

class BookingPriceDetailsTile extends StatelessWidget {
  const BookingPriceDetailsTile({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    this.rightLabelColor,
  });

  final String leftLabel;
  final String rightLabel;
  final Color? rightLabelColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftLabel,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary.withOpacity(.4),
          ),
        ),
        Text(
          rightLabel,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: rightLabelColor,
          ),
        ),
      ],
    );
  }
}
