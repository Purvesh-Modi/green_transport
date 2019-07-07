import 'package:flutter/material.dart';
import 'package:green_transport/models/bus.dart';

class BusCard extends StatelessWidget {
  final Bus bus;

  BusCard({this.bus});

  @override
  Widget build(BuildContext context) {
    print(bus.source);
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.event,
                  color: Colors.indigo,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(bus.source,
                      style: TextStyle(
                          color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.bold),
                      maxLines: 2),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0, 4.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 18,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    bus.dest,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
