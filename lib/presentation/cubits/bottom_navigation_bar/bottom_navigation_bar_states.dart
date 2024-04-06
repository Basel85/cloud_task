abstract class BottomNavigationBarState {}

class BottomNavigationBarInitialState extends BottomNavigationBarState {}

class BottomNavigationBarIndexChangedState extends BottomNavigationBarState {
  final int index;
  BottomNavigationBarIndexChangedState({required this.index});
}
