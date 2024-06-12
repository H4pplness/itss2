import 'package:dio/dio.dart';
import 'package:itss2/network.dart';
import 'package:itss2/storage/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_field_bookings.g.dart';

class GetFieldBookingDTO {
  String? date;
  String? startTime;
  String? endTime;
  String? fieldName;
  String? location;

  GetFieldBookingDTO({this.date, this.startTime, this.endTime, this.fieldName,
      this.location});
}

@riverpod
Future<List<GetFieldBookingDTO>?> getFieldBooking(ref) async {
  final dio = ref.read(dioProvider);
  final userId = ref.read(loginedUserProvider).getId();
  Response response = await dio.get('booking/field?user_id=$userId');

  if(response.statusCode == 200){
    final result = response.data as List;

    return result.map((raw) => GetFieldBookingDTO(
      date: raw['booking_date'],
      startTime: raw['startTime'],
      endTime: raw['endTime'],
      fieldName: raw['fieldname'],
      location: raw['location']
    )).toList();
  }
}