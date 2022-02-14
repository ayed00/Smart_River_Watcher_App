import 'package:flutter/material.dart';
import 'package:Smart_River_Watcher_App/models/capture.dart';
import 'package:Smart_River_Watcher_App/utilities/SQL_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var usersend;
var valsend;
var locationsend;
var latitudesend;
var logitudesend;
Map jsonvalue;
var idsend;
var datesend;
var heuresend;
var response;

class Homesql extends StatefulWidget {
  @override
  _HomesqlState createState() => _HomesqlState();
}

class _HomesqlState extends State<Homesql> {
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  afficheresponse() async {
    print(await response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Database'),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: FutureBuilder(
        future: helper.allCapture(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  Capture capture = Capture.fromMap(snapshot.data[1]);
                  jsonvalue = jsonDecode(capture.valcapture);
                  usersend = capture.user;
                  valsend = capture.valcapture;

                  locationsend = capture.location;
                  latitudesend = capture.latitude;
                  logitudesend = capture.longitude;
                  datesend = capture.date;
                  heuresend = capture.heure;
                  idsend = capture.id;
                  var url = 'http://192.168.1.8/dashboard_dash/inserdata.php';

                  var data = {
                    /*
                      'date': dateapp,  
                      'user': myController.text,
                      'location': selectedUser.name,
                      'latitude': latitude,
                      'longitude': longitude,*/
                    // 'id': idsend,
                    // 'date': dateapp,
                    // 'heure': dateapp2,
                    'user': usersend,
                    'textaffich': valsend,
                    'date': datesend,
                    'heure': heuresend,
                    'location': locationsend,
                    'latitude': latitudesend,
                    'logitude': logitudesend,
                  };

                  // Starting Web Call with data.
                  response = http.post(url, body: json.encode(data));
                  Future.delayed(const Duration(milliseconds: 500));
                  //print(response);
                  afficheresponse();
                  print(data);
                  // Getting Server response into variable.
                  // var message = (response.body);
                  // print(message);
                  return Card(
                    child: ListTile(
                      title: Text(
                          '${capture.user}  mqttvaleur : ${capture.valcapture} '),
                      subtitle: Text(
                          '${capture.valcapture} /location: ${capture.location}               -latitude : ${capture.latitude}    -longitude : ${capture.longitude}'),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
