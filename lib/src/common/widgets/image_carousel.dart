import 'package:flutter/material.dart';
import 'package:hotel_choosing/src/config/styles/dimensions.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
    required this.images,
    required this.onPageChanged,
  });

  final List<String> images;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageView.builder(
      onPageChanged: onPageChanged,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: BorderRadius.circular(
                HotelChoosingDimensions.large,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                HotelChoosingDimensions.large,
              ),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingStatus) {
                  if (loadingStatus == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingStatus.expectedTotalBytes != null
                          ? loadingStatus.cumulativeBytesLoaded /
                              loadingStatus.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      error.toString(),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
