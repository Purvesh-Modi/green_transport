import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_transport/models/bus.dart';

class FireStoreDatabase {
  getBus() {
    return Firestore.instance.collection('bus').snapshots();
  }
  
  storeNewEvent(Bus bus, context) {
    Firestore.instance
        .collection("bus")
        .add({
          'bus_id': bus.busId,
          'source': bus.source,
        })
        .then((value) {})
        .catchError((onError) {
          print(onError);
        });
  }
}
