import 'package:Smart_River_Watcher_App/main.dart';
import 'package:Smart_River_Watcher_App/widgets/pageBotton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:Smart_River_Watcher_App/widgets/login.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Page_2 extends StatefulWidget {
  @override
  _Page_2State createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {
  // MQTTAppState currentAppState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //  backgroundColor: Colors.blueAccent,
      //  title: Text("Second Page"),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 10),
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
              SizedBox(
                height: 500.0,
                width: 300.0,
                child: Carousel(
                  images: [
                    Carouselscreen(
                        'Using Autonomous Low-Tech IoT solution to monitor river water quality',
                        'assets/images/7.gif'),
                    Carouselscreen(
                        'Connected Smart Boat to monitor Water Quality',
                        'assets/images/2.gif'),
                  ],
                  animationDuration: Duration(seconds: 1),
                  dotSize: 6.0,
                  dotSpacing: 20.0,
                  dotColor: Colors.purple,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.purple.withOpacity(0.01),
                  borderRadius: false,
                  moveIndicatorFromBottom: 180.0,
                  noRadiusForIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Colors.white,
                  overlayShadowSize: 0.7,
                ),
              ),
              SizedBox(height: 78.0),
              Container(
                //alignment: Alignment.center,
                height: 100.0,
                width: double.infinity,
                color: Colors.white,

                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Connectcarte()),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.purple,
                        highlightColor: Colors.purpleAccent,
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: Color(0xFF5B16D0),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //_buildScrollableTextWith(currentAppState.getHistoryText)
            ],
          ),
        ),
      ),
    );
  }
}

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);

class Carouselscreen extends StatelessWidget {
  final String start_text;
  final String start_2text;
  Carouselscreen(this.start_text, this.start_2text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Opacity(
                opacity: 0.6,
                child: Image(
                  image: new AssetImage(
                    start_2text,
                  ),
                  height: 280.0,
                  width: 400.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'SmartRiverWatcher',
            style: kTitleStyle,
          ),
          SizedBox(height: 20.0),
          Text(
            start_text,
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
