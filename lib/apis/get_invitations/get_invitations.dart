import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

class InvitationNotifier extends StateNotifier<List<InvitationDTO>?> {
  InvitationNotifier(this.ref) : super([]);
  final Ref ref;

  void changeStatus(int index, String status) {
    if (state != null && index >= 0 && index < state!.length) {
      final updatedInvitation = InvitationDTO(
          id: state![index].id,
          status: status,
          name: state![index].name,
          start_time: state![index].start_time,
          end_time: state![index].end_time,
          date: state![index].date,
          userId: state![index].userId,
          booking_player_id: state![index].booking_player_id);
      state = [
        ...state!.sublist(0, index),
        updatedInvitation,
        ...state!.sublist(index + 1),
      ];
    }
  }

  Future<void> fetchInvitation() async {
    final dio = ref.read(dioProvider);
    final userId = ref.read(loginedUserProvider).getId();
    Response response = await dio.get('booking/player/invite?user_id=$userId');
    if (response.statusCode == 200) {
      final result = response.data as List;
      state = result
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
}

final invitationNotifierProvider = StateNotifierProvider<InvitationNotifier,List<InvitationDTO>?>((ref){
  final notifier = InvitationNotifier(ref);
  notifier.fetchInvitation();
  return notifier;
});
