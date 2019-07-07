import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:green_transport/app_routing/routing_constants.dart';
import 'package:green_transport/constants/Constants.dart';
import 'package:green_transport/firestore/firestore_api.dart';
import 'package:intl/intl.dart';

import 'app_translations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  var _sourceValue;
  var _destValue;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sourceValue = AppTranslations.of(context).text("source");
    _destValue = AppTranslations.of(context).text("Destination");
  }

  var textStyle;

  FireStoreDatabase fireStoreDatabase = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.title;
    print(fireStoreDatabase.getBus());
    return Scaffold(
        appBar: AppBar(
          title: Text("Green Transport"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Screens.SELECT_LANGUAGE);
              },
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Arc(
                  height: 50,
                  child: Container(
                    height: 250,
                    color: Colors.blue,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppTranslations.of(context).text("Where_do_you_want_to_go"),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.directions_bus,
                  size: 80,
                  color: Colors.white,
                ),
                sourceDestinationCard(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    elevation: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Search Buses",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Screens.DETAILS);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  sourceDestinationCard() {
    var _sourceStationList = Constants.sourceStationList;
    var _destinationStationList = Constants.sourceStationList;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text(
                              AppTranslations.of(context).text("source"),
                              style: textStyle,
                            ),
                            isExpanded: true,
                            style: textStyle,
                            items: _sourceStationList.map((dropDownText) {
                              return DropdownMenuItem(
                                value: AppTranslations.of(context).text(dropDownText),
                                child: Text(AppTranslations.of(context).text(dropDownText)),
                              );
                            }).toList(),
                            onChanged: (String value) => _onSourceTextChanged,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text(
                              AppTranslations.of(context).text("Destination"),
                              style: textStyle,
                            ),
                            isExpanded: true,
                            style: textStyle,
                            items: _destinationStationList.map((dropDownText) {
                              return DropdownMenuItem(
                                value: AppTranslations.of(context).text(dropDownText),
                                child: Text(AppTranslations.of(context).text(dropDownText)),
                              );
                            }).toList(),
                            onChanged: (String value) => _onDestinationTextChanged,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: GestureDetector(
                        onTap: () => _selectStartDate(),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                _startDateValue,
                                style: textStyle,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _selectStartDate(),
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  String _startDateValue;

  Future _selectStartDate() async {
    DateTime now = DateTime.now();
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(2099));
    if (picked != null) {
      final current = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(picked.toString());
      print(current.toString());
      final f = DateFormat('MM/dd/yyyy').format(current);
      print(f.toString());
      _startDateValue = f.toString();
      setState(() => _startDateValue);
    }
  }

  /*child: StreamBuilder<QuerySnapshot>(
  stream: fireStoreDatabase.getBus(),
  builder: (context, snapshot) {
  if (snapshot.hasData) {
  Bus newBus;
  return ListView.builder(
  itemCount: snapshot.data.documents.length,
  itemBuilder: (context, index) {
  newBus = Bus.fromSnapshot(snapshot.data.documents[index]);
  return BusCard(bus: newBus);
  });
  } else {
  return Container(
  padding: EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
  ),
  child: Text("No Buses Found !"),
  );
  }
  },
  ),*/

  _onSourceTextChanged(String source) {
    setState(() {
      _sourceValue = source;
    });
  }

  void _onSwapIconClick() {
    //Todo: Swap the values
  }

  _onDestinationTextChanged(String destination) {
    setState(() {
      _destValue = destination;
    });
  }

  void _onGoButtonClick() {
    Navigator.of(context).pushNamed(Screens.DETAILS);
  }
}
