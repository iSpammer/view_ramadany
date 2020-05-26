import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:viewramadany/Components/models.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _userRef;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    // Demonstrates configuring to the database using a file
    // Demonstrates configuring the database directly

    _userRef = database.reference().child('movies');

    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
  }

  DatabaseError getError() {
    return error;
  }

  DatabaseReference getUser() {
    return _userRef;
  }

  void dispose() {
    _messagesSubscription.cancel();
  }
}
