import 'package:flutter/material.dart';
import 'package:itss2/models/player_booking.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_player_notifier.g.dart';

@riverpod
class BookPlayerNotifier extends _$BookPlayerNotifier {
  @override
  PlayerBooking build() {
    return PlayerBooking();
  }

  void setSport(Sport sport) {
    state = PlayerBooking(
        user: state.user,
        sport: sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: state.needField,
        date: state.date);
  }

  void setUser(User user) {
    state = PlayerBooking(
        user: user,
        sport: state.sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: state.needField,
        date: state.date);
  }

  void setNeedField(bool needField) {
    state = PlayerBooking(
        user: state.user,
        sport: state.sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: needField,
        date: state.date);
  }

  void setStartTime(TimeOfDay time) {
    state = PlayerBooking(
        user: state.user,
        sport: state.sport,
        startTime: time,
        endTime: state.endTime,
        needField: state.needField,
        date: state.date);
  }

  void setEndTime(TimeOfDay time) {
    state = PlayerBooking(
        user: state.user,
        sport: state.sport,
        startTime: state.startTime,
        endTime: time,
        needField: state.needField,
        date: state.date
    );
  }

  void setDate(DateTime date){
    state = PlayerBooking(
        user: state.user,
        sport: state.sport,
        startTime: state.startTime,
        endTime: state.endTime,
        needField: state.needField,
        date: date
    );
  }
}
