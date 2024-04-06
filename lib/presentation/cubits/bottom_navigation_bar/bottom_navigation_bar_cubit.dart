import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/presentation/cubits/bottom_navigation_bar/bottom_navigation_bar_states.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitialState());
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);
  void changeIndex(int index) =>
      emit(BottomNavigationBarIndexChangedState(index: index));
}
