import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_booking_player.g.dart';

class GetBookingPlayerDTO {
  String? date;
  String? startTime;
  String? endTime;
  String? bookingPlayerId;
  String? userId;
  String? username;

  GetBookingPlayerDTO(
      {this.date,
      this.startTime,
      this.endTime,
      this.userId,
      this.username,
      this.bookingPlayerId});
}

class GetBookingPlayerParams {
  String? date;
  String? startTime;
  String? endTime;
  String? sport;

  GetBookingPlayerParams({this.date, this.startTime, this.endTime, this.sport});
}

@riverpod
Future<List<GetBookingPlayerDTO>?> getBookingPlayer(
    GetBookingPlayerRef ref, GetBookingPlayerParams params) async {
  final dio = ref.read(dioProvider);
  final userId = ref.read(loginedUserProvider).getId();
  Response response =
      await dio.get('booking/player/get-booking-player', queryParameters: {
    'date': params.date,
    'start_time': params.startTime,
    'end_time': params.endTime,
    'sport': params.sport,
    'user_id': userId,
  });

  if (response.statusCode == 200) {
    print("DA QUA DAY");
    final result = response.data as List;
    print("DA QUA DAY : $result");
    if (result.isEmpty) return [];
    final listBookingPlayer = await result
        .map((bookingPlayer) => GetBookingPlayerDTO(
            date: bookingPlayer['date'],
            startTime: bookingPlayer['start_time'],
            endTime: bookingPlayer['end_time'],
            userId: bookingPlayer['user_id'],
            username: bookingPlayer['user_name'],
            bookingPlayerId: bookingPlayer['id']))
        .toList();

    print("DA CHAY QUA DAY : ${listBookingPlayer.length}");

    return listBookingPlayer;
  } else {
    throw Exception(response.statusMessage);
  }
}
