import 'package:cloud_firestore/cloud_firestore.dart';

class Bus {
  String busId;
  String source;
  String dest;
  int stops;
  String arrivalTime;
  String departureTime;
  
  
  Bus.fromSnapshot(DocumentSnapshot snapshot):
      busId = snapshot['bus_id'],
      source = snapshot['source'],
      dest = snapshot['dest'],
      stops = snapshot['stops'],
      arrivalTime = snapshot['arrival_time'],
      departureTime = snapshot['departure_time'];
  
  Bus(this.busId, this.source, this.dest, this.stops, this.arrivalTime,
    this.departureTime);
}