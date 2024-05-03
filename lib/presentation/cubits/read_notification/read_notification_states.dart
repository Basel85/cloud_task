import 'package:quran_app/data/models/notification_model.dart';

abstract class ReadNotificationState {}

class ReadNotificationInitial extends ReadNotificationState {}

class ReadNotificationChanged extends ReadNotificationState {
  final List<NotificationModel> notifications;

  ReadNotificationChanged(this.notifications);
}

