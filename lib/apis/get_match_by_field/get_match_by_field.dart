
import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/match.dart';

part 'get_match_by_field.g.dart';

class GetMatchByFieldParam{
  String? fieldId;
  String? date;

  GetMatchByFieldParam({this.fieldId, this.date});
}

@riverpod
Future<List<Match>?> getMatchByField(ref,GetMatchByFieldParam params) async{
  final dio = ref.read(dioProvider);
  Response response = await dio.get('match?field_id=${params.fieldId}&date=${params.date}');
  if(response.statusCode == 200){
    final result = response.data as List;
    return result.map((raw) => Match(
      id: raw['id'],
      fieldName: raw['field_name'],
      startTime: raw['start_time'],
      endTime: raw['end_time'],
      price: raw['price']
    )).toList();
  }else{
    throw Exception(response.statusMessage);
  }
}