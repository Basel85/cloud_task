import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/presentation/cubits/radio_button/radio_button_states.dart';

class RadioButtonCubit extends Cubit<RadioButtonStates> {
  late String currentValue;
  RadioButtonCubit() : super(RadioButtonInitial()) {
    currentValue = Intl.getCurrentLocale();
  }
  static RadioButtonCubit get(context) => BlocProvider.of(context);
  void changeRadioButton({required String value}) {
    if (currentValue == value) return;
    currentValue = value;
    emit(RadioButtonChanged());
  }
}
