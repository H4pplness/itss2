import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_invitation.g.dart';

class UpdateInvitationParam {
  String? invitationId;
  String? status;

  UpdateInvitationParam({this.invitationId, this.status});
}

@riverpod
Future<void> updateInvitation(ref,UpdateInvitationParam params) async {
  final dio = ref.read(dioProvider);
  Response response = await dio.post('booking/player/update-invitation?invitation_id=${params.invitationId}&status=${params.status}');
  if(response.statusCode == 201){
    return;
  }else{
    throw Exception();
  }
}