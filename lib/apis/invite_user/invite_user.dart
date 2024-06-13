
import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invite_user.g.dart';

@riverpod
Future<void> inviteUser(ref,String? bookingPlayerId) async {
  final dio = ref.read(dioProvider);
  final userId = ref.read(loginedUserProvider).getId();
  Response response = await dio.post('booking/player/invite' , data : {
    'inviterId' : userId,
    'bookingPlayerId' : bookingPlayerId
  });

  if(response.statusCode == 201){
    return;
  }else{
    throw Exception(response.statusMessage);
  }
}