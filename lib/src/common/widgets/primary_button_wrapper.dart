import 'package:flutter/material.dart';
import 'package:hotel_choosing/src/common/widgets/primary_button.dart';

class PrimaryButtonWrapper extends StatelessWidget {
  const PrimaryButtonWrapper({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.onBackground,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary.withOpacity(.08),
          ),
        ),
      ),
      child: PrimaryButton(
        onPressed: onPressed,
        label: label,
      ),
    );
  }
}
