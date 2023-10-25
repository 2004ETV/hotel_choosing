import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel_choosing/main.dart';
import 'package:hotel_choosing/src/common/formatters/phone_formatter.dart';
import 'package:hotel_choosing/src/common/widgets/primary_button_wrapper.dart';
import 'package:hotel_choosing/src/common/widgets/rating_chip.dart';
import 'package:hotel_choosing/src/config/styles/dimensions.dart';
import 'package:hotel_choosing/src/screens/booking/presentation/widget/booking_details_tile.dart';
import 'package:hotel_choosing/src/screens/booking/presentation/widget/booking_price_details_tile.dart';
import 'package:intl/intl.dart';

final hotelBookingProvider = FutureProvider((ref) async {
  final hotelBookingRepository = ref.watch(hotelBookingRepositoryProvider);
  final hotelBookingData =
      await hotelBookingRepository.getHotelBookingDomainData();
  return hotelBookingData;
});

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final hotelBookingData = ref.watch(hotelBookingProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(localizations.booking),
      ),
      body: hotelBookingData.when(
        data: (data) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(
                      HotelChoosingDimensions.large,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingChip(label: data.ratingName),
                      const SizedBox(height: 8),
                      Text(
                        data.hotelName,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.hotelAddress,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
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
                      HotelChoosingDimensions.large,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      BookingDetailsTile(
                        leftLabel: localizations.departure_from,
                        rightLabel: data.departure,
                      ),
                      const SizedBox(height: 16),
                      BookingDetailsTile(
                        leftLabel: localizations.country_city,
                        rightLabel: data.arrivalCountry,
                      ),
                      const SizedBox(height: 16),
                      BookingDetailsTile(
                        leftLabel: localizations.dates,
                        rightLabel:
                            '${data.tourDateStart} - ${data.tourDateStop}',
                      ),
                      const SizedBox(height: 16),
                      BookingDetailsTile(
                        leftLabel: localizations.number_of_nights,
                        rightLabel: '${data.numberOfNights}',
                      ),
                      const SizedBox(height: 16),
                      BookingDetailsTile(
                        leftLabel: localizations.hotel,
                        rightLabel: data.hotelName,
                      ),
                      const SizedBox(height: 16),
                      BookingDetailsTile(
                        leftLabel: localizations.room,
                        rightLabel: data.room,
                      ),
                      const SizedBox(height: 16),
                      BookingDetailsTile(
                        leftLabel: localizations.nutrition,
                        rightLabel: data.nutrition,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(
                      HotelChoosingDimensions.large,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.information_about_the_buyer,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        style: theme.textTheme.bodyMedium,
                        decoration: InputDecoration(
                          label: Text(localizations.phone_number),
                          hintText: '+7 (951) 555-99-00',
                        ),
                        inputFormatters: [phoneFormatter],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        style: theme.textTheme.bodyMedium,
                        decoration: InputDecoration(
                          label: Text(localizations.email),
                          hintText: 'examplemail000@mail.ru',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Эти данные никому не передаются. '
                        'После оплаты мы вышли чек на '
                        'указанный вами номер и почту',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.primary.withOpacity(.4),
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
                      HotelChoosingDimensions.large,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      BookingPriceDetailsTile(
                        leftLabel: 'Тур',
                        rightLabel: NumberFormat.simpleCurrency(
                          locale: 'ru-RU',
                          decimalDigits: 0,
                        ).format(
                          data.tourPrice - data.fuelCharge - data.serviceCharge,
                        ),
                      ),
                      const SizedBox(height: 16),
                      BookingPriceDetailsTile(
                        leftLabel: 'Топливный сбор',
                        rightLabel: NumberFormat.simpleCurrency(
                          locale: 'ru-RU',
                          decimalDigits: 0,
                        ).format(data.serviceCharge),
                      ),
                      const SizedBox(height: 16),
                      BookingPriceDetailsTile(
                        leftLabel: 'Сервисный сбор',
                        rightLabel: NumberFormat.simpleCurrency(
                          locale: 'ru-RU',
                          decimalDigits: 0,
                        ).format(data.fuelCharge),
                      ),
                      const SizedBox(height: 16),
                      BookingPriceDetailsTile(
                        leftLabel: 'К оплате',
                        rightLabel: NumberFormat.simpleCurrency(
                          locale: 'ru-RU',
                          decimalDigits: 0,
                        ).format(data.tourPrice),
                        rightLabelColor: theme.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text('$error}'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: hotelBookingData.when(
        data: (data) {
          return SafeArea(
            child: PrimaryButtonWrapper(
              onPressed: () {},
              label: '${localizations.pay} ${NumberFormat.simpleCurrency(
                locale: 'ru-RU',
                decimalDigits: 0,
              ).format(data.tourPrice)}',
            ),
          );
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      ),
    );
  }
}
