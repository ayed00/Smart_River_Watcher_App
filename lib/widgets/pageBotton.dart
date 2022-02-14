import 'dart:io' show Platform;

import 'package:Smart_River_Watcher_App/widgets/sqlitetest.dart';
import 'package:flutter/material.dart';

import 'package:Smart_River_Watcher_App/main.dart';
import 'package:Smart_River_Watcher_App/widgets/flashbar.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Smart_River_Watcher_App/widgets/connectivity.dart';
import 'package:Smart_River_Watcher_App/utilities/SQL_helper.dart';
import 'package:Smart_River_Watcher_App/widgets/mqttView.dart';
import 'package:Smart_River_Watcher_App/widgets/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String latitude = '';
String longitude = '';

class Connectcarte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConnectcarteState();
  }
}

class _ConnectcarteState extends State<Connectcarte> {
  // MQTTAppState currentAppState;
  DbHelper helper;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    helper = DbHelper();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = '${geoposition.latitude}';
      longitude = '${geoposition.longitude}';
    });
    //Position position = await Geolocator.getLastKnownPosition();

    //setState(() {
    // laltitiude = '${position.altitude}';
    //  longitude = '${position.longitude}';
    //});
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Scaffold scaffold = Scaffold(
        // resizeToAvoidBottomPadding: false,
        // appBar: _buildAppBar(context),
        body: _buildColumn());
    return scaffold;
  }

  Widget _buildColumn() {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: ListView(
            children: <Widget>[
              // Expanded(

              Connectwifi(),

              _buildEditableColumn(),
              const SizedBox(height: 15),
              // ),
              _buildScrollableTextWith(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 0.5),
          _buildConnecteButtonFrom()
        ],
      ),
    );
  }

  Widget _buildScrollableTextWith() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        //  decoration:
        //    BoxDecoration(gradient: LinearGradient(colors: signInGradients)),
        // color: Colors.blue[300],
        width: 425,
        height: 165,
        child: ListView(
            //physics:
            //    NeverScrollableScrollPhysics(), // <-- this will disable scroll
            shrinkWrap: true,
            children: <Widget>[
              Text(' latitude : $latitude',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 25,
                      fontFamily: "ShadowsIntoLightTwo")),
              Text(' longitude : $longitude',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 25,
                      fontFamily: "ShadowsIntoLightTwo")),
            ]),
      ),
    );
  }

  Widget _buildConnecteButtonFrom() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 40),
        SizedBox(
          height: 90,
          width: 210,
          child: Container(
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.lightBlue[200],
                  blurRadius: 15,
                  offset: Offset(-2, 1), // Shadow position
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              gradient: LinearGradient(
                colors: signInGradients,
                //begin: Alignment.topLeft,
                //end: Alignment.bottomRight),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 210,
                height: 90,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  disabledBorderColor: Colors.blue,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        child: Image.asset('assets/images/database2.png'),
                        width: 49,
                        height: 45,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "COLLECT DATA ",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 15,
                            fontFamily: "ShadowsIntoLightTwo"),
                      )
                    ],
                  ),
                  onPressed: () {
                    if (wifiiName != 'GHADAA') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    } else
                      custom(context, 'Please connect to the wifi boat ');
                  },
                ),
              ),
            ),
          ),
        ),
        //

        const SizedBox(height: 60),
        SizedBox(
          height: 90,
          width: 210,
          child: Container(
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.lightBlue[200],
                  blurRadius: 15,
                  offset: Offset(-2, 1), // Shadow position
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              gradient: LinearGradient(
                colors: signInGradients,
                //begin: Alignment.topLeft,
                //end: Alignment.bottomRight),
              ),
            ),
            child: SizedBox(
              width: 210,
              height: 90,
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                disabledBorderColor: Colors.blue,
                child: Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    SizedBox(
                      child: Image.asset('assets/images/cloud-computing.png'),
                      width: 38,
                      height: 52,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "SEND DATA TO CLOUD ",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 13,
                          fontFamily: "ShadowsIntoLightTwo"),
                    )
                  ],
                ),
                onPressed: () async {
                  if (connected == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homesql()),
                    );
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Image(
                              width: 70,
                              height: 70,
                              image: AssetImage('assets/images/checked.png'),
                            ),
                            content: Padding(
                              padding: EdgeInsets.only(right: 10, left: 40),
                              child: Text(
                                '  ${http.Response} ',
                                style: stylealert,
                              ),
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Connectcarte()),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 110),
                                  child: Center(
                                    child: Text(
                                      'ok',
                                      style: TextStyle(
                                        //backgroundColor: Colors.white,
                                        color: Colors.blue,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            backgroundColor: Colors.blue[900],
                            elevation: 24,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(130),
                            ),
                          );
                        });

                    /* var url = 'http://192.168.1.8/dashboard_dash/inserdata.php';

                    var data = {
                      /*
                      'date': dateapp,
                      'user': myController.text,
                      'location': selectedUser.name,
                      'latitude': latitude,
                      'longitude': longitude,*/
                      'id': idsend,
                      'date': dateapp,
                      'heure': dateapp2,
                      'user': usersend,
                      'valString': valsend,
                      'valjson': jsonvalue,
                      'ph': jsonvalue["ph"],
                      'conductivte': jsonvalue["conductivite"],
                      'temperature': jsonvalue["temp"],
                      'humidity': jsonvalue["humidite"],
                      'location': locationsend,
                      'latitude': latitudesend,
                      'logitude': logitudesend,
                    };

                    // Starting Web Call with data.
                    var response =
                        await http.post(url, body: json.encode(data));

                    // Getting Server response into variable.
                    var message = (response.body);
                    print(message);*/
                  } else
                    custom(context, 'Please connect to the wifi ');
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 60),
        SizedBox(
          height: 90,
          width: 210,

          //  color: LinearGradient(colors: signInGradients),
          child: Container(
            // padding: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.lightBlue[200],
                  blurRadius: 15,
                  offset: Offset(-2, 1), // Shadow position
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              gradient: LinearGradient(
                  colors: signInGradients,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Center(
              child: SizedBox(
                width: 210,
                height: 90,
                child: OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    disabledBorderColor: Colors.blue,
                    onPressed: () async {
                      int id = await helper.deleteCapture(9);
                      print('delete id is $id');

                      idd = 0;

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Image(
                                width: 70,
                                height: 70,
                                image: AssetImage('assets/images/checked.png'),
                              ),
                              content: Padding(
                                padding: EdgeInsets.only(right: 10, left: 40),
                                child: Text(
                                  'Delete Success :$id data ',
                                  style: stylealert,
                                ),
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 110),
                                    child: Center(
                                      child: Text(
                                        'ok',
                                        style: TextStyle(
                                          //backgroundColor: Colors.white,
                                          color: Colors.blue,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              backgroundColor: Colors.blue[900],
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(130),
                              ),
                            );
                          });
                    },
                    child: Row(children: [
                      SizedBox(
                        child: Image.asset('assets/images/delete.png'),
                        width: 38,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "DELETE DATA",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 17,
                            fontFamily: "ShadowsIntoLightTwo"),
                      ),
                    ])),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];
