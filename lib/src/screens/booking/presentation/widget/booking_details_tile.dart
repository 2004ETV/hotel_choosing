import 'package:flutter/material.dart';

class BookingDetailsTile extends StatelessWidget {
  const BookingDetailsTile({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
  });

  final String leftLabel;
  final String rightLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            leftLabel,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary.withOpacity(.4),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            rightLabel,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
