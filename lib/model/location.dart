import 'package:firebase_database/firebase_database.dart';

class Location {
  String? key;
  String user;
  String latitud;
  String longitud;


  Location(this.user, this.latitud, this.longitud);

  Location.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        user = snapshot.value['user'],
        latitud = snapshot.value['latitud'],
        longitud = snapshot.value['longitud'];

  toJson() {
    return {
      "user": user,
      "latitud": latitud,
      "longitud": longitud
    };
  }
}
