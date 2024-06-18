import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';


class GetFieldBookingDTO {
  String? date;
  String? startTime;
  String? endTime;
  String? fieldName;
  String? location;

  GetFieldBookingDTO({this.date, this.startTime, this.endTime, this.fieldName,
      this.location});
}

class BookingNotifier extends StateNotifier<List<GetFieldBookingDTO>?> {
  final Ref ref;

  BookingNotifier(this.ref) : super([]);

  void addBooking(GetFieldBookingDTO booking) {
    state = [...?state, booking];
  }

  Future<void> fetchBookings() async {
    final dio = ref.read(dioProvider);
    final userId = ref.read(loginedUserProvider).getId();
    Response response = await dio.get('booking/field?user_id=$userId');

    if (response.statusCode == 200) {
      final result = response.data as List;
      final bookings = result.map((raw) => GetFieldBookingDTO(
          date: raw['booking_date'],
          startTime: raw['startTime'],
          endTime: raw['endTime'],
          fieldName: raw['fieldname'],
          location: raw['location']
      )).toList();
      state = bookings;
    }
  }
}

final bookingNotifierProvider = StateNotifierProvider<BookingNotifier, List<GetFieldBookingDTO>?>((ref) {
  final notifier = BookingNotifier(ref);
  notifier.fetchBookings();
  return notifier;
});