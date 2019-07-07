import 'package:flutter/material.dart';
import 'package:green_transport/constants/Constants.dart';
import 'package:green_transport/firestore/firestore_api.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  var textStyle;

  FireStoreDatabase fireStoreDatabase = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.title;
    print(fireStoreDatabase.getBus());
    return Scaffold(
      appBar: AppBar(
        title: Text("Green Transport"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
              onPressed: () => _onGoButtonClick,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      "Source",
                      style: textStyle,
                    ),
                    isExpanded: true,
                    style: textStyle,
                    items: _sourceStationList.map((dropDownText) {
                      return DropdownMenuItem(
                        value: dropDownText,
                        child: Text(dropDownText),
                      );
                    }).toList(),
                    onChanged: (String value) => _onSourceTextChanged,
                  ),
                ),
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
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      "Destination",
                      style: textStyle,
                    ),
                    isExpanded: true,
                    style: textStyle,
                    items: _destinationStationList.map((dropDownText) {
                      return DropdownMenuItem(
                        value: dropDownText,
                        child: Text(dropDownText),
                      );
                    }).toList(),
                    onChanged: (String value) => _onSourceTextChanged,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
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
            SizedBox(
              height: 48,
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                OutlineButton(
                  splashColor: Colors.blue[300],
                  borderSide:
                      BorderSide(color: Colors.blue[700], style: BorderStyle.solid, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: _onGoButtonClick,
                  child: Text('GO'),
                ),
              ],
            ),*/
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  String _startDateValue = 'Start Date';

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
    //Todo: Store the new value to req object
  }

  void _onSwapIconClick() {
    //Todo: Swap the values
  }

  _onDestinationTextChanged(String destination) {
    //Todo: Store the new value to req object
  }

  void _onGoButtonClick() {
    //Todo: Navigate to next screen
  }
}
