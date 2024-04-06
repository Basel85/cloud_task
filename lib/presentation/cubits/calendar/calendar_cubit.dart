import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/presentation/cubits/calendar/calendar_states.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());
  static CalendarCubit get(context) => BlocProvider.of(context);
  void selectDay(DateTime focusedDay) {
    emit(CalendarDaySelectedState(focusedDay));
  }
}
