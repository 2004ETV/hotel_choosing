import 'package:flutter/material.dart';

class CarouselDotIndicator extends StatelessWidget {
  const CarouselDotIndicator({
    super.key,
    required this.isActive,
    required this.index,
  });

  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 4,
      backgroundColor: isActive
          ? Colors.black
          : Colors.black.withAlpha(
              (100 - index * 10) >= 50 ? 100 - index * 10 : 50,
            ),
    );
  }
}
