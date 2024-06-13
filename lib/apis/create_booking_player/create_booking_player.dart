import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_booking_player.g.dart';

class CreateBookingPlayerBody {
  String? date;
  String? startTime;
  String? endTime;
  String? sport;

  CreateBookingPlayerBody(
      { this.date, this.startTime, this.endTime, this.sport});
}

@riverpod
Future<void> createBookingPlayer(ref, CreateBookingPlayerBody data) async {
  final dio = ref.read(dioProvider);
  final userId = ref.read(loginedUserProvider).getId();

  Response response = await dio.post('booking/player/new-booking-player',data:{
    'userId' : userId,
    'date' : data.date,
    'startTime' : data.startTime,
    'endTime' : data.endTime,
    'sport' : data.sport
  });

  if(response.statusCode == 201){
    return;
  }else{
    throw Exception();
  }

}
