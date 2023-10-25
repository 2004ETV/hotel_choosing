import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel_choosing/main.dart';
import 'package:hotel_choosing/src/common/assets/assets.dart';
import 'package:hotel_choosing/src/common/widgets/carousel_dot_indicator.dart';
import 'package:hotel_choosing/src/common/widgets/image_carousel.dart';
import 'package:hotel_choosing/src/common/widgets/primary_button_wrapper.dart';
import 'package:hotel_choosing/src/common/widgets/rating_chip.dart';
import 'package:hotel_choosing/src/config/routes/routes.dart';
import 'package:hotel_choosing/src/config/styles/dimensions.dart';
import 'package:hotel_choosing/src/screens/hotel_details/presentation/widgets/peculiarities_list_tile.dart';
import 'package:intl/intl.dart';

final hotelDetailsProvider = FutureProvider((ref) async {
  final hotelDetailsRepository = ref.watch(hotelDetailsRepositoryProvider);
  final hotelDetails = await hotelDetailsRepository.getHotelDetails();
  return hotelDetails;
});

class HotelDetailsScreen extends HookConsumerWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final hotelDetailsData = ref.watch(hotelDetailsProvider);
    final imageCarouselIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.hotel),
      ),
      body: hotelDetailsData.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(HotelChoosingDimensions.medium),
                    bottomRight:
                        Radius.circular(HotelChoosingDimensions.medium),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 260,
                      child: Stack(
                        children: [
                          ImageCarousel(
                            images: data.images,
                            onPageChanged: (index) =>
                                imageCarouselIndex.value = index,
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
                                    data.images.length,
                                    (index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: CarouselDotIndicator(
                                          isActive:
                                              imageCarouselIndex.value == index,
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
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RatingChip(label: data.ratingName),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        data.name,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        data.address,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
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
                            '${localizations.from.toLowerCase()} '
                            '${NumberFormat.simpleCurrency(
                              locale: 'ru-RU',
                              decimalDigits: 0,
                            ).format(data.minimalPrice)}',
                            style: theme.textTheme.displayLarge,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            data.priceForIt.toLowerCase(),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary.withOpacity(.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(
                    HotelChoosingDimensions.medium,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      localizations.about_the_hotel,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: List.generate(
                        data.aboutHotelDomain.peculiarities.length,
                        (index) => Chip(
                          label: Text(
                            data.aboutHotelDomain.peculiarities[index],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      data.aboutHotelDomain.description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(
                          HotelChoosingDimensions.large,
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          PeculiaritiesListTile(
                            icon: Assets.iconEmojiHappy,
                            title: localizations.conveniences,
                            description: localizations.the_most_necessary,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 38),
                            child: Divider(
                              color:
                                  theme.colorScheme.secondary.withOpacity(.15),
                            ),
                          ),
                          PeculiaritiesListTile(
                            icon: Assets.iconTickSquare,
                            title: localizations.what_is_included,
                            description: localizations.the_most_necessary,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 38),
                            child: Divider(
                              color:
                                  theme.colorScheme.secondary.withOpacity(.15),
                            ),
                          ),
                          PeculiaritiesListTile(
                            icon: Assets.iconCloseSquare,
                            title: localizations.what_is_not_included,
                            description: localizations.the_most_necessary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            children: [
              Text(error.toString()),
            ],
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      bottomNavigationBar: hotelDetailsData.when(
        data: (data) => SafeArea(
          child: PrimaryButtonWrapper(
            onPressed: () =>
                RoomsScreenRoute(hotelName: data.name).push(context),
            label: localizations.to_choose_a_hotel_room,
          ),
        ),
        error: (error, stackTrace) => null,
        loading: () => null,
      ),
    );
  }
}
