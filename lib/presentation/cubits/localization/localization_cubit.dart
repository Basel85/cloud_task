import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/presentation/cubits/localization/localization_states.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  late String _languageCode;
  LocalizationCubit() : super(LocalizationInitial()) {
    _languageCode = Intl.getCurrentLocale();
    debugPrint(_languageCode);
  }
  static LocalizationCubit of(context) =>
      BlocProvider.of<LocalizationCubit>(context);
  void changeLocalization(String languageCode, {String? countryCode}) {
    if (_languageCode == languageCode) return;
    emit(LocalizationChanged(
        languageCode: languageCode, countryCode: countryCode));
  }
}
