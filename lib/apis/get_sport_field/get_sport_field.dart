import 'package:dio/dio.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/sport-field.dart';

part 'get_sport_field.g.dart';

@riverpod
Future<List<SportField>?> getSportField(ref, String? sport) async {
  final dio = ref.read(dioProvider);
  Response response = await dio.get('field?sport=$sport');
  if (response.statusCode == 200) {
    final result = response.data as List;
    print("DA CHAY QUA DAY : $result");
    final listsportfield =  result
        .map((rawField) => SportField(
            id: rawField['id'],
            name: rawField['name'],
            location: rawField['location'],
            sport: rawField['sport'] == 'football'?football:rawField['badminton'] == 'badminton'?badminton:basketball,
            image: rawField['image']))
        .toList();
    return listsportfield;
  } else {
    throw Exception();
  }
}
