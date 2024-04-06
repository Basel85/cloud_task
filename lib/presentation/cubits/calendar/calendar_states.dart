abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarDaySelectedState extends CalendarState {
  final DateTime focusedDay;
  CalendarDaySelectedState(this.focusedDay);
}
