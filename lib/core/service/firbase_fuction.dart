import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirbaseFunctions {
  static void updateNewNotificationStatus(String isNewNotification) {
    final database = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://mahmoud-task-91156-default-rtdb.europe-west1.firebasedatabase.app/")
        .ref();

    database
        .update({
          "showNewNotificatioDot": isNewNotification,
        })
        .then((_) {})
        .catchError((onError) {});
  }
}
