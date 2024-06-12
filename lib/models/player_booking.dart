import 'package:flutter/material.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/models/user.dart';

class PlayerBooking {
  User? user;
  Sport? sport;
  DateTime? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool needField;

  PlayerBooking(
      {this.user,
      this.date,
      this.startTime,
      this.endTime,
      this.needField = true,
      this.sport});
}
