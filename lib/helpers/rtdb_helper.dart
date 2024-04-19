import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RTDBHelper {
  static late FirebaseDatabase _database;
  static late DatabaseReference _ref;

  static void init() {
    _database = FirebaseDatabase.instance;
    _ref = FirebaseDatabase.instance.ref();
  }

  static void writeNotification(RemoteNotification notification) async {
    debugPrint("Writing notification to RTDB");
    print("Hello sssss");
    await _ref.child("notification").push().set({
      "title": notification.title,
      "body": notification.body,
      "datetime": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    });
  }
}
