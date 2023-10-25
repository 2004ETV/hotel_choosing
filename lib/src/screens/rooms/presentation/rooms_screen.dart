import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel_choosing/main.dart';
import 'package:hotel_choosing/src/config/routes/routes.dart';
import 'package:hotel_choosing/src/screens/rooms/presentation/widgets/room_card.dart';

final hotelRoomsProvider = FutureProvider(
  (ref) async {
    final hotelRoomsRepository = ref.watch(hotelRoomsRepositoryProvider);
    final hotelRooms = await hotelRoomsRepository.getHotelRooms();
    return hotelRooms;
  },
);

class RoomsScreen extends ConsumerWidget {
  const RoomsScreen({
    super.key,
    required this.hotelName,
  });

  final String hotelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelRoomsData = ref.watch(hotelRoomsProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(hotelName),
      ),
      body: hotelRoomsData.when(
        data: (data) => SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) {
              return RoomCard(
                roomModel: data[index],
                onPressed: () =>
                    BookingScreenRoute(id: data[index].id).push(context),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: data.length,
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
