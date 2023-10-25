import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotel_choosing/src/common/widgets/carousel_dot_indicator.dart';
import 'package:hotel_choosing/src/common/widgets/image_carousel.dart';
import 'package:hotel_choosing/src/common/widgets/primary_button.dart';
import 'package:hotel_choosing/src/config/styles/dimensions.dart';
import 'package:hotel_choosing/src/repositories/rooms/domain/models/hotel_room_domain.dart';
import 'package:intl/intl.dart';

class RoomCard extends HookWidget {
  const RoomCard({
    super.key,
    required this.roomModel,
    required this.onPressed,
  });

  final HotelRoomsDomain roomModel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final imageCarouselIndex = useState(0);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(
          HotelChoosingDimensions.medium,
        ),
      ),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                ImageCarousel(
                  images: roomModel.images,
                  onPageChanged: (index) => imageCarouselIndex.value = index,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(
                          HotelChoosingDimensions.extraSmall,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          roomModel.images.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CarouselDotIndicator(
                                isActive: imageCarouselIndex.value == index,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              roomModel.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children: List.generate(
                roomModel.peculiarities.length,
                (index) => Chip(
                  label: Text(roomModel.peculiarities[index]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(localizations.more_about_room),
                  const SizedBox(width: 2),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.simpleCurrency(
                    locale: 'ru-RU',
                    decimalDigits: 0,
                  ).format(roomModel.price),
                  style: theme.textTheme.displayLarge,
                ),
                const SizedBox(width: 8),
                Text(
                  roomModel.pricePeriod.toLowerCase(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary.withOpacity(.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed: onPressed,
                    label: localizations.choose_a_hotel_room,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
