import 'package:flutter/material.dart';
import 'package:Smart_River_Watcher_App/widgets/mqttView.dart';
import 'package:Smart_River_Watcher_App/mqtt/state/MQTTAppState.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'package:Smart_River_Watcher_App/widgets/pagede_start.dart';
import 'package:Smart_River_Watcher_App/mqtt/MQTTManager.dart';

void main() => runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: MyApp_2()),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartRiverWatcher',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MQTTAppState>(
        create: (_) => MQTTAppState(),
        child: MQTTView(),
      ),
    );
  }
}

/*
Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child:Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text("Connect"),
                  onPressed: manager.connect ,
                ),
              )
            ],
          ) ,
        ),
      )
 */

class MyApp_2 extends StatefulWidget {
  @override
  _MyApp_2State createState() => new _MyApp_2State();
}

class _MyApp_2State extends State<MyApp_2> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 7,
        navigateAfterSeconds: new Page_2(),
        title: new Text('App SmartRiverWatcher',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        image: new Image.asset('assets/images/launch_image.png'),
        backgroundColor: Color(0xFFFFFFFF),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
