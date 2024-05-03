class NotificationModel {
  final String title;
  final String body;
  final String time;

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      time: json['datetime'],
    );
  }
}
