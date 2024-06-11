

import 'package:itss2/models/booking.dart';
import 'package:itss2/models/sport-field.dart';
import 'package:itss2/models/sport.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_course_notifier.g.dart';

class BookFieldDTO {
  Sport? sport;
  SportField? field;
  Booking? booking;

  BookFieldDTO({this.sport, this.field, this.booking});
}



@riverpod
class BookCourseNotifier extends _$BookCourseNotifier {
  @override
  BookFieldDTO build(){
    return BookFieldDTO();
  }

  void setSport(Sport? sport){
    state = BookFieldDTO(sport: sport,field: state.field, booking: state.booking);
  }

  void setField(SportField? field){
    state = BookFieldDTO(sport: state.sport,field: field,booking: state.booking);
  }

  void setBooking(Booking? booking){
    state = BookFieldDTO(sport: state.sport,field: state.field , booking: booking);
  }
}
