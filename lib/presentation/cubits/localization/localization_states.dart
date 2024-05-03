abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LocalizationChanged extends LocalizationState {
  final String languageCode;
  final String? countryCode;

  LocalizationChanged({required this.languageCode, this.countryCode});
}
