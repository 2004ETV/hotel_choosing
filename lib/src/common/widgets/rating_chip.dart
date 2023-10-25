import 'package:flutter/material.dart';
import 'package:hotel_choosing/src/config/styles/dimensions.dart';

class RatingChip extends StatelessWidget {
  const RatingChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          HotelChoosingDimensions.extraSmall,
        ),
        color: theme.colorScheme.onSecondaryContainer.withOpacity(.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: theme.colorScheme.onSecondary,
            ),
            const SizedBox(width: 2),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
