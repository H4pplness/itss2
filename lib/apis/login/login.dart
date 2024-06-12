
import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

class LoginParams {
  String? username;
  String? password;

  LoginParams({this.username, this.password});
}

@riverpod
Future<bool> login(ref,LoginParams params) async {
  print("Da vao day");
  final dio = ref.read(dioProvider);
  print("Da vao day");
  Response response = await dio.get('user/login',data : {
    "username" : params.username,
    "password" : params.password
  });
  print("Da vao day");
  if(response.statusCode == 200){
    final loginUser =ref.read(loginedUserProvider);
    final id = response.data['userId'];
    await loginUser.setId(id);
    return true;
  }else{
    throw Exception();
  }
}