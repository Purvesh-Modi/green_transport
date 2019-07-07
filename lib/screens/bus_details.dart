import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

import 'app_translations.dart';

class BusDetailsScreen extends StatefulWidget {
  @override
  _BusDetailsScreenState createState() => _BusDetailsScreenState();
}

class _BusDetailsScreenState extends State<BusDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Arc(
                height: 50,
                child: Container(
                  height: 250,
                  color: Colors.blue,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppTranslations.of(context).text("Vadodara"),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "images/way.png",
                          color: Colors.white,
                          height: 20,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppTranslations.of(context).text("Surat"),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "12th - ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Jan - ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "2019 | ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Monday",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.directions_bus,
                          color: Colors.white,
                          size: 70,
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 14,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text("9:00AM - 12:00PM"),
                              subtitle: Text("GSRTC"),
                              trailing: Column(
                                children: <Widget>[
                                  Text(
                                    "300.00",
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    child: Text("3"),
                                  )
                                ],
                              ),
                            ),
                            color: Colors.white,
                          );
                        }),
                    /* child: Card(
//                        itemCount: 6,
//                        itemBuilder: (context, index) {
//                          return Card(
                      elevation: 10,
                              child: ListTile(
                                title: Text("9:00AM - 12:00PM"),
                                subtitle: Text("GSRTC"),
                                trailing: Column(
                                  children: <Widget>[
                                    Text(
                                      "\$300.00",
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                    SizedBox(height: 10,),
                                    CircleAvatar(
                                      radius: 15,
                                      child: Text("3"),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
//                        }),*/
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
