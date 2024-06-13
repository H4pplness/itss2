import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_invitations.g.dart';

class InvitationDTO {
  String? id;
  String? status;
  String? name;
  String? start_time;
  String? end_time;
  String? date;
  String? userId;
  String? booking_player_id;

  InvitationDTO(
      {this.id,
      this.status,
      this.name,
      this.start_time,
      this.end_time,
      this.date,
      this.userId,
      this.booking_player_id});
}

@riverpod
Future<List<InvitationDTO>> getInvitations(ref) async {
  final dio = ref.read(dioProvider);
  final userId = ref.read(loginedUserProvider).getId();
  Response response = await dio.get('booking/player/invite?user_id=$userId');
  if (response.statusCode == 200) {
    final result = response.data as List;
    return result
        .map((invitation) => InvitationDTO(
            id: invitation['id'],
            booking_player_id: invitation['booking_player_id'],
            start_time: invitation['start_time'],
            end_time: invitation['end_time'],
            date: invitation['date'],
            name: invitation['name'],
            userId: invitation['user_id'],
            status: invitation['status']))
        .toList();
  } else {
    throw Exception();
  }
}
