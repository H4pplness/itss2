
import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_field.g.dart';

class BookFieldData {
  String? matchId;
  String? date;

  BookFieldData({this.matchId, this.date});
}


@riverpod
Future<void> bookField (ref,BookFieldData data) async{
  final userId = ref.read(loginedUserProvider).getId();

  final dio = ref.read(dioProvider);
  Response response = await dio.post('booking/field',data:{
    'userId' : userId,
    'matchId' : data.matchId,
    'date' : data.date
  });

  if(response.statusCode == 201){
    return;
  }else{
    throw Exception(response.statusMessage);
  }
}