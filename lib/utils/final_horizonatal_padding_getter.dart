import 'package:intl/intl.dart';

mixin FinalHorizontalPaddingGetter {
  double getTheLeftPadding({required double firstPadding, required double secondPadding}) {
    return Intl.getCurrentLocale() == 'ar' ? firstPadding : secondPadding;
  }

  double getTheRightPadding({required double firstPadding, required double secondPadding}) {
    return Intl.getCurrentLocale() == 'ar' ? firstPadding : secondPadding;
  }
}
