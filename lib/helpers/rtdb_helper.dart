import 'package:firebase_database/firebase_database.dart';

class RTDBHelper {
  static late FirebaseDatabase _database;
  static late DatabaseReference _ref;

  static void init() {
    _database = FirebaseDatabase.instance;
    _ref = FirebaseDatabase.instance.ref();
  }
  
}
