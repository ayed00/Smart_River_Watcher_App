import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

var wifiiName;
bool connectedd;
bool connected;

class Connectwifi extends StatefulWidget {
  @override
  _ConnectwifiState createState() => _ConnectwifiState();
}

class _ConnectwifiState extends State<Connectwifi> {
  @override
  void initState() {
    super.initState();
    wfiname();
    //}

    // connect() {
    // ConnectivityResult connectivity;
    // final bool connected = (connectivity != ConnectivityResult.none);

    // return connected;
  }

  wfiname() async {
    var wifiName = await WifiInfo().getWifiName();

    setState(() {
      wifiiName = wifiName;
      if (wifiiName == null)
        wifiiName = 'There is no network connection right now';
      // wifiiName = wifiName;
    });
  }

  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          connected = connectivity != ConnectivityResult.none;

          wfiname();
          return Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                  child: connected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Text(
                                "ONLINE",
                                style: TextStyle(color: Colors.white),
                              ),
                            ])
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Text(
                                "OFFLINE",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            ])),
              SizedBox(
                height: 20,
              ),
              (wifiiName == 'There is no network connection right now')
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${wifiiName}',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 16,
                              fontFamily: "ShadowsIntoLightTwo"),
                        ),
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Image.asset('assets/images/no-wifi.png'),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${wifiiName}',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontFamily: "ShadowsIntoLightTwo"),
                        ),
                        SizedBox(
                          width: 60,
                          height: 40,
                          child: Image.asset('assets/images/gifwifi.gif'),
                        ),
                      ],
                    )
            ],
          );
        },
        child: Text(''),
      );
    });
  }
}
