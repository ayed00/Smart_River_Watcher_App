import 'dart:io' show Platform;
import 'package:Smart_River_Watcher_App/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Smart_River_Watcher_App/mqtt/state/MQTTAppState.dart';
import 'package:Smart_River_Watcher_App/mqtt/MQTTManager.dart';
import 'package:Smart_River_Watcher_App/widgets/pagede_start.dart';
import 'package:Smart_River_Watcher_App/widgets/login.dart';
import 'package:Smart_River_Watcher_App/widgets/pageBotton.dart';
import 'package:flutter/services.dart';
import 'package:Smart_River_Watcher_App/models/capture.dart';
import 'package:Smart_River_Watcher_App/utilities/SQL_helper.dart';
import 'dart:convert';

String imageassetboutton = 'assets/images/wireless.png';
String textcap;
int idd = 0;
int idd2 = 0;
MQTTAppState currentAppState;
Map conertextcap;
var myController3 = TextEditingController();
String cONNECT = 'START';
String textaffich = '';
int x;
String variable = '';

//String text;

class MQTTView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MQTTViewState();
  }
}

class _MQTTViewState extends State<MQTTView> {
  // MQTTAppState currentAppState;
  MQTTManager manager;
  DbHelper2 helper2;
  GlobalKey<RefreshIndicatorState> refreshKey;
  @override
  void initState() {
    super.initState();
    helper2 = DbHelper2();
    //getCurrentLocation();

    imageassetboutton = 'assets/images/wireless.png';
    cONNECT = 'START';
/*
    _hostTextController.addListener(_printLatestValue);
    _messageTextController.addListener(_printLatestValue);
    _topicTextController.addListener(_printLatestValue);
 */
  }

/* Mimic a delay and add a random value to the list */

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
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
              _buildConnectionStateText(_prepareStateMessageFrom(
                  currentAppState.getAppConnectionState)),
              // Expanded(

              _buildEditableColumn(),

              // ),
              SizedBox(
                height: 50,
              ),
              // _buildScrollableTextWith(currentAppState.getHistoryText),
              //  _buildScrollableTextWithsqlite(),
              Afichevaleurcapteur(),
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
          //   _buildTextFieldWith(_hostTextController, 'Enter broker address',
          //    currentAppState.getAppConnectionState),
          const SizedBox(height: 10),
          //  _buildTextFieldWith(
          //    _topicTextController,
          //   'Enter a topic to subscribe or listen',
          //   currentAppState.getAppConnectionState),
          //  const SizedBox(height: 70),
          // _buildPublishMessageRow(),
          // const SizedBox(height: 70),
          _buildConnecteButtonFrom(currentAppState.getAppConnectionState)
        ],
      ),
    );
  }
/*
  Widget _buildPublishMessageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _buildTextFieldWith(_messageTextController, 'Enter a message',
              currentAppState.getAppConnectionState),
        ),
        _buildSendButtonFrom(currentAppState.getAppConnectionState)
      ],
    );
  }*/

  Widget _buildConnectionStateText(String status) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              // color: Colors.deepOrangeAccent,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: signInGradients,
                  //begin: Alignment.topLeft,
                  //end: Alignment.bottomRight),
                ),
              ),

              // color: Colors.orange[700],
              child: Text(status, textAlign: TextAlign.center)),
        ),
      ],
    );
  }

  Widget _buildConnecteButtonFrom(MQTTAppConnectionState state) {
    deletedata() async {
      int id = await helper2.deleteCapture2(9);
      print('delete id is $id');
      idd2 = 0;

      cONNECT = 'START';
      imageassetboutton = 'assets/images/wireless.png';
    }

    return Column(
      children: <Widget>[
        // Padding(
        // padding: const EdgeInsets.only(left: 1.0, right: 200),
        // child: Texttopform('Pointes'),
        //),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 80,
          width: 200,
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: Colors.lightBlue[200],
                blurRadius: 15,
                offset: Offset(-3, 1), // Shadow position
              ),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                  splashColor: Colors.red,
                  child: Row(children: [
                    SizedBox(
                      child: Image.asset(imageassetboutton),
                      width: 60,
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      cONNECT,
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 17,
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                  ]),
                  onPressed: () {
                    if (cONNECT == 'Accueil') {
                      deletedata();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Connectcarte()),
                      );
                      _disconnect();
                      setState(() {
                        cONNECT = 'START';
                        imageassetboutton = 'assets/images/wireless.png';
                      });
                    }
                    if ((state == MQTTAppConnectionState.disconnected) &&
                        (cONNECT == 'START')) {
                      _configureAndConnect();
                      setState(() {
                        // conertextcap = jsonDecode(textcap);
                        cONNECT = 'Accueil';
                        imageassetboutton = 'assets/images/homepage.png';
                      });
                    }

                    // text = currentAppState.getHistoryText;
                  }

                  //},
                  ),
            ),
          ),
          //
        ),
      ],
    );
  }

/*
  Widget _buildSendButtonFrom(MQTTAppConnectionState state) {
    return RaisedButton(
      color: Colors.green,
      child: const Text('Send'),
      onPressed: state == MQTTAppConnectionState.connected
          ? () {
              _publishMessage(_messageTextController.text);
            }
          : null, //
    );
  }
*/
  // Utility functions
  String _prepareStateMessageFrom(MQTTAppConnectionState state) {
    switch (state) {
      case MQTTAppConnectionState.connected:
        return 'Connected';
      case MQTTAppConnectionState.connecting:
        return 'Connecting';
      case MQTTAppConnectionState.disconnected:
        return 'Disconnected';
    }
  }

  void _configureAndConnect() {
    // TODO: Use UUID
    String topicapture;
    manager = MQTTManager(
        host: '192.168.4.1',
        topic: 'mqtt',
        identifier: 'android',
        state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }

  void _disconnect() {
    manager.disconnect();
  }
}

const List<Color> signInGradients = [
  Colors.red,
  Colors.orange,
];
const List<Color> signInGradients2 = [
  Colors.orange,
  Colors.red,
];

Widget buildConnectionStateText(String status) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Container(
            // color: Colors.deepOrangeAccent,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: signInGradients,
                //begin: Alignment.topLeft,
                //end: Alignment.bottomRight),
              ),
            ),

            // color: Colors.orange[700],
            child: Text(status, textAlign: TextAlign.center)),
      ),
    ],
  );
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

class Afichevaleurcapteur extends StatefulWidget {
  @override
  _AfichevaleurcapteurState createState() => _AfichevaleurcapteurState();
}

class _AfichevaleurcapteurState extends State<Afichevaleurcapteur> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: signInGradients,
                //begin: Alignment.topLeft,
                //end: Alignment.bottomRight),
              ),
            ),
            //  color: Colors.blue[300],
            width: 414,
            height: 700,
            child: ListView(children: <Widget>[
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 100,
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF61A3FE), Color(0xFF63FFD5)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(4, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Sqliteaffiches("conductivite", "conductivite",
                        'assets/images/conductivite.png'),

                    /*   Text(
                            'Conductivité',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "ShadowsIntoLightTwo",
                                fontSize: 21,
                                fontWeight: FontWeight.w700),
                          ),*/
                    /*  IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sqliteaffiche(
                                        "Conductivité",
                                        "conductivite",
                                        'assets/images/conductivite.png')),
                              );
                            },
                          ),*/
                  ),
                  Container(
                      width: 350,
                      height: 100,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFA738), Color(0xFFFFE130)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Sqliteaffiches("humidite", "humidite",
                          'assets/images/humidity.png')),
                  Container(
                      width: 350,
                      height: 100,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Sqliteaffiches("temperature", "temp",
                          'assets/images/centigrade.png')),
                  Container(
                      width: 350,
                      height: 100,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFE6197), Color(0xFFFFB463)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Sqliteaffiches(
                          "Ph", "ph", 'assets/images/meters.png')),
                ],
              )
            ])));
  }
}

class sqliteaffiche extends StatefulWidget {
  String namecapture;
  String valeur;
  String imagecapture;
  sqliteaffiche(this.namecapture, this.valeur, this.imagecapture);
  @override
  _sqliteafficheState createState() => _sqliteafficheState();
}

class _sqliteafficheState extends State<sqliteaffiche> {
  DbHelper helper;
  GlobalKey<RefreshIndicatorState> refreshKey;

  sqlite() async {
    setState(() {
      textaffich = pt;
      if (textaffich == null) {
        textaffich =
            '{"temp":"xx-xx","ph":"xx-xx","conductivite":"xx-xx","humidite":"xx-xx"}';
      }

      //conertextcap = jsonDecode(text);
    });
    var capture = Capture({
      'id': idd,
      'user': myController.text,
      'valcapture': textaffich,
      'date': dateapp,
      'location': selectedUser.name,
      'latitude': latitude,
      'longitude': longitude,
    });
    //  if (textaffich !=
    //   '{"temp":"xx-xx","ph":"xx-xx","conductivite":"xx-xx","humidite":"xx-xx"}') {
    int id = await helper.createCapture(capture);
    idd = idd + 1;
    print('course id is $id');
    //}
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      sqlite();
    });

    return null;
  }

  @override
  void initState() {
    super.initState();
    //getCurrentLocation();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    helper = DbHelper();
  }

  Widget build(BuildContext context) {
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
        child: FutureBuilder(
          future: helper.allCapture(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              refreshList();

              //sqlite();

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    Capture capture = Capture.fromMap(snapshot.data[i]);

                    //  conertextcap = jsonDecode(capture.valcapture);
                    conertextcap = jsonDecode(textaffich);

                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: SizedBox(
                            height: 35,
                            width: 30,
                            child: Image.asset(widget.imagecapture)),
                        title: Text(
                          // ' ${widget.namecapture}: ${conertextcap[widget.valeur]} \n date : ${capture.date} ',
                          ' ${widget.namecapture}: ${conertextcap[widget.valeur]} \n date : ${capture.date} ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            int id = await helper.deleteonlyCapture(capture.id);
                            print('delete id is $id');
                            setState(() {
                              _sqliteafficheState();
                            });
                          },
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    ));
  }
}

class Sqliteaffiches extends StatefulWidget {
  String namecapture;
  String valeur;
  String imagecapture;
  Sqliteaffiches(this.namecapture, this.valeur, this.imagecapture);
  @override
  _SqliteafficheStates createState() => _SqliteafficheStates();
}

class _SqliteafficheStates extends State<Sqliteaffiches> {
  DbHelper helper;
  DbHelper2 helper2;
  GlobalKey<RefreshIndicatorState> refreshKey;

  sqlite() async {
    setState(() {
      textaffich = pt;
      if (textaffich == null) {
        textaffich =
            '{"temp":"xx-xx","ph":"xx-xx","conductivite":"xx-xx","humidite":"xx-xx"}';
      }

      //conertextcap = jsonDecode(text);
    });
    var capture = Capture({
      'id': idd,
      'user': myController.text,
      'valcapture': textaffich,
      'date': dateapp,
      'heure': dateapp2,
      'location': selectedUser.name,
      'latitude': latitude,
      'longitude': longitude,
    });
    var capture2 = Capture2({
      'id2': idd,
      'user2': myController.text,
      'valcapture2': textaffich,
      'date2': dateapp,
      'location2': selectedUser.name,
      'latitude2': latitude,
      'longitude2': longitude,
    });

    //  if (textaffich !=
    //   '{"temp":"xx-xx","ph":"xx-xx","conductivite":"xx-xx","humidite":"xx-xx"}') {
    setState(() {
      textaffich = pt;
    });
    if (idd2 < 7) {
      await Future.delayed(const Duration(milliseconds: 500));
      int id2 = await helper2.createCapture2(capture2);
      idd2 = idd2 + 1;
      print('course2 id is $id2');
      int id = await helper.createCapture(capture);

      idd = idd + 1;
      print('course id is $id');
      await Future.delayed(const Duration(milliseconds: 500));
    }
    setState(() {
      textaffich = pt;
    });
    //}
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 3));

    sqlite();

    return null;
  }

  @override
  void initState() {
    super.initState();
    //getCurrentLocation();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    helper = DbHelper();
    helper2 = DbHelper2();
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: helper2.allCapture2(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //  state = MQTTAppConnectionState.connected;
            if (currentAppState.getAppConnectionState ==
                MQTTAppConnectionState.connected) {
              refreshList();
            }

            //sqlite();

            return Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(widget.imagecapture)),
                    SizedBox(
                      width: 2,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text('${widget.namecapture} : ',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 22)),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${dateapp}  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    Capture2 capture2 = Capture2.fromMap(snapshot.data[i]);

                    //  conertextcap = jsonDecode(capture.valcapture);
                    conertextcap = jsonDecode(capture2.valcapture2);

                    return Row(
                      children: <Widget>[
                        SizedBox(width: 200),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 25,
                          child: Text(
                            // ' ${widget.namecapture}: ${conertextcap[widget.valeur]} \n date : ${capture.date} ',
                            '  ${conertextcap[widget.valeur]} \n  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            int id =
                                await helper2.deleteonlyCapture2(capture2.id2);
                            print('delete id is $id');
                            setState(() {
                              _sqliteafficheState();
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
