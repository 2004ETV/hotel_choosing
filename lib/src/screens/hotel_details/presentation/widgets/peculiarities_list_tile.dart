import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PeculiaritiesListTile extends StatelessWidget {
  const PeculiaritiesListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final String icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(title),
      ),
      subtitle: Text(description),
      leading: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.secondary,
          BlendMode.srcIn,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
