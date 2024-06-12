import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_player_notifier.g.dart';

class PlayerBooking{
  String? userId;
  String? sport;
  String? startTime;
  String? endTime;
  bool needField;
  String? date;

  PlayerBooking({this.userId, this.sport, this.startTime, this.endTime,
      this.needField = false, this.date});
}

@riverpod
class BookPlayerNotifier extends _$BookPlayerNotifier {
  @override
  PlayerBooking build() {
    return PlayerBooking();
  }

  void setSport(String? sport) {
    state = PlayerBooking(
        userId: state.userId,
        sport: sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: state.needField,
        date: state.date);
  }

  void setUser(String userId) {
    state = PlayerBooking(
        userId: userId,
        sport: state.sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: state.needField,
        date: state.date);
  }

  void setNeedField(bool needField) {
    state = PlayerBooking(
        userId: state.userId,
        sport: state.sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: needField,
        date: state.date);
  }

  void setStartTime(String? time) {
    state = PlayerBooking(
        userId: state.userId,
        sport: state.sport,
        startTime: time,
        endTime: state.endTime,
        needField: state.needField,
        date: state.date);
  }

  void setEndTime(String? time) {
    state = PlayerBooking(
        userId: state.userId,
        sport: state.sport,
        startTime: state.startTime,
        endTime: time,
        needField: state.needField,
        date: state.date
    );
  }

  void setDate(String date){
    state = PlayerBooking(
        userId: state.userId,
        sport: state.sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: state.needField,
        date: date
    );
  }
}
