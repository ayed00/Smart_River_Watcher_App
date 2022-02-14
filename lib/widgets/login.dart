import 'package:Smart_River_Watcher_App/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:Smart_River_Watcher_App/widgets/pageBotton.dart';
import 'package:Smart_River_Watcher_App/widgets/mqttView.dart';
import 'package:Smart_River_Watcher_App/utilities/SQL_helper.dart';

var myController = TextEditingController();
var myController2 = TextEditingController();
Item selectedUser;
DateTime date_app = new DateTime.now();
String dateapp = ' ${date_app.year}/${date_app.month}/${date_app.day}    ';
String dateapp2 = '   ${date_app.hour}:${date_app.minute}  ';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  backgroundColor: Colors.blueAccent,
      //  title: Text("Second Page"),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
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
              SizedBox(
                height: 20,
              ),
              Center(child: Header()),
              Expanded(
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Inputlogin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 165,
            decoration: BoxDecoration(
              image: DecorationImage(
                //width: 150,
                //height: 180,
                image: AssetImage('assets/images/iconlogin.png'),
              ),
              //color: Colors.teal,
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlue[200],
                  blurRadius: 6,
                  offset: Offset(1, 1), // Shadow position
                ),
              ],
            ),
          ),
          // Image(
          // width: 150,
          //height: 180,
          //image: AssetImage('assets/images/iconlogin.png'),
          //),
          //
          /*
          Text(
            '  Login',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'CM Sans Serif',
              fontSize: 38.0,
            ),
          ),*/
        ],
      ),
    );
  }
}

class Inputlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Tooltip(
              message: "Current Time",
              child: Text(
                dateapp,
                style: styledate,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Texttopform('FullName'),
                InputWidget(
                  30.0,
                  0.0,
                  "Ayedboukadida@example.com",
                  myController,
                ),
                SizedBox(height: 20),
                // Texttopform('Location'),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    // InputWidget(30.0, 0.0, "Location...", myController2),
                    InputWidget2(),
                    Bottomtext(),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

final styledate = TextStyle(
    fontSize: 24, color: Colors.blueAccent, fontFamily: 'Staatliches-Regular');

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;
  final String hint_text;
  final myController;
  InputWidget(
    this.topRight,
    this.bottomRight,
    this.hint_text,
    this.myController,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(bottomRight),
                  topRight: Radius.circular(topRight))),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
            child: TextFormField(
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint_text,
                  hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class InputWidget2 extends StatefulWidget {
  @override
  _InputWidget2State createState() => _InputWidget2State();
}

class _InputWidget2State extends State<InputWidget2> {
  List<Item> users = <Item>[
    const Item(
        'Point 1',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
    const Item(
        'Point 2',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
    const Item(
        'Point 3',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
    const Item(
        'Point 4',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
    const Item(
        'Point 5',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
    const Item(
        'Point 6',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
    const Item(
        'Point 7',
        Icon(
          Icons.map,
          color: Colors.lightBlue,
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: DropdownButton<Item>(
          hint: Text("Select Location"),
          value: selectedUser,
          onChanged: (Item Value) {
            setState(() {
              selectedUser = Value;
            });
          },
          items: users.map((Item user) {
            return DropdownMenuItem<Item>(
              value: user,
              child: Row(
                children: <Widget>[
                  user.icon,
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.name,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Bottomtext extends StatefulWidget {
  @override
  _BottomtextState createState() => _BottomtextState();
}

class _BottomtextState extends State<Bottomtext> {
  DbHelper2 helper2;

  @override
  void initState() {
    super.initState();

    helper2 = DbHelper2();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 40, right: 50),
              child: Text(
                '...',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              gradient: LinearGradient(
                  colors: signInGradients,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: GestureDetector(
              onTap: () async {
                if ((myController.text == '') || (selectedUser.name == '')) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Image(
                            width: 50,
                            height: 80,
                            image: AssetImage('assets/images/alert.png'),
                          ),
                          content: Text(
                            'Please Enter Your Name And Location',
                            style: stylealert,
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
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
                          ],
                          backgroundColor: Colors.blue[900],
                          elevation: 24,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        );
                      });
                } else {
                  InputWidget2();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                  int id = await helper2.deleteCapture2(9);
                  print('delete id is $id');
                  idd2 = 0;
                }
              },
              child: ImageIcon(
                AssetImage(
                  'assets/images/ic_forward.png',
                ),
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Texttopform extends StatelessWidget {
  final String text_top;
  Texttopform(this.text_top);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, left: 40),
      child: Text(
        text_top,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF999A9A),
        ),
      ),
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
];
final stylealert = TextStyle(
    fontSize: 24, color: Colors.white, fontFamily: 'Staatliches-Regular');
