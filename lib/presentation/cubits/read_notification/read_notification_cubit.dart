import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/presentation/cubits/read_notification/read_notification_states.dart';

class NotificationCubit extends Cubit<ReadNotificationState> {
  NotificationCubit() : super(ReadNotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);
  void readNotification() {
    emit(ReadNotificationChanged([]));
  }
}