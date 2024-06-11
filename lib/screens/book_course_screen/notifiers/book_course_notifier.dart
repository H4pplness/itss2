class BookCourseDTO {
  String? sport;
  String? course;
  DateTime? time;

  BookCourseDTO({this.sport,this.course,this.time});
}


// class BookCourseNotifier extends _$BookCourseNotifier {
//   @override
//   BookCourseDTO build(){
//     return BookCourseDTO();
//   }
//
//   void setSport(String? sport){
//     state = BookCourseDTO(sport: sport??state.sport,course: state.course,time: state.time);
//   }
//
//   void setCourse(String?)
// }
