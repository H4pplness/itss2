
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class GetMyBookingPlayerDTO {
  String? id;
  String? date;
  String? start_time;
  String? end_time;
  String? sport;
  bool? status;

  GetMyBookingPlayerDTO({this.id, this.date, this.start_time, this.end_time,
      this.sport, this.status});
}

// @riverpod
// Future<List<GetMyBookingPlayerDTO>> getMyBookingPlayer(ref) async{
//   final dio = ref.read(dioProvider);
//   final userId = ref.read(loginedUserProvider).getId();
//   Response response = await dio.get('booking/player/list-booking-player?user_id=$userId');
//   if(response.statusCode == 200){
//     final result = response.data as List;
//     return result.map((e) => GetMyBookingPlayerDTO(
//       id: e['id'],
//       date: e['date'],
//       start_time: e['start_time'],
//       end_time: e['end_time'],
//       status: e['status'],
//       sport: e['sport']
//     )).toList();
//   }else{
//     throw Exception();
//   }
//
// }

class MyBookingPlayerNotifier extends StateNotifier<List<GetMyBookingPlayerDTO>?>{
  MyBookingPlayerNotifier(this.ref):super([]);
  final Ref ref;

  void addBookingPlayer(GetMyBookingPlayerDTO newBookingPlayer){
    state = [...?state,newBookingPlayer];
  }

  Future<void> fetchMyBookingPlayer() async{
    final dio = ref.read(dioProvider);
    final userId = ref.read(loginedUserProvider).getId();
    Response response = await dio.get('booking/player/list-booking-player?user_id=$userId');
    if(response.statusCode == 200){
      final result = response.data as List;
      state = result.map((e) => GetMyBookingPlayerDTO(
          id: e['id'],
          date: e['date'],
          start_time: e['start_time'],
          end_time: e['end_time'],
          status: e['status'],
          sport: e['sport']
      )).toList();
    }else{
      throw Exception();
    }
  }

}

final myBookingPlayerNotifierProvider = StateNotifierProvider<MyBookingPlayerNotifier,List<GetMyBookingPlayerDTO>?>((ref){
  final notifier = MyBookingPlayerNotifier(ref);
  notifier.fetchMyBookingPlayer();
  return notifier;
});