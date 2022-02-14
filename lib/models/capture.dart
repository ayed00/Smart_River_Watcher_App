import 'dart:ffi';

class Capture {
  int _id;
  String _user;
  String _valcapture;
  String _date;
  String _heure;
  String _location;
  String _latitude;
  String _longitude;
  Capture(dynamic obj) {
    _id = obj["id"];
    _user = obj["user"];
    _valcapture = obj["valcapture"];
    _date = obj["date"];
    _heure = obj["heure"];
    _location = obj["location"];
    _latitude = obj["latitude"];
    _longitude = obj["longitude"];
  }
  Capture.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _user = data["user"];
    _valcapture = data["valcapture"];
    _date = data["date"];
    _heure = data["heure"];
    _location = data["location"];
    _latitude = data["latitude"];
    _longitude = data["longitude"];
  }
  Map<String, dynamic> toMap() => {
        'id': _id,
        'user': _user,
        'valcapture': _valcapture,
        'date': _date,
        'heure': _heure,
        'location': _location,
        'latitude': _latitude,
        'longitude': _longitude,
      };
  int get id => _id;
  String get user => _user;
  String get valcapture => _valcapture;
  String get date => _date;
  String get heure => _heure;
  String get location => _location;
  String get latitude => _latitude;
  String get longitude => _longitude;
}

class Capture2 {
  int _id2;
  String _user2;
  String _valcapture2;
  String _date2;
  String _location2;
  String _latitude2;
  String _longitude2;
  Capture2(dynamic obj) {
    _id2 = obj["id2"];
    _user2 = obj["user2"];
    _valcapture2 = obj["valcapture2"];
    _date2 = obj["date2"];
    _location2 = obj["location2"];
    _latitude2 = obj["latitude2"];
    _longitude2 = obj["longitude2"];
  }
  Capture2.fromMap(Map<String, dynamic> data) {
    _id2 = data["id2"];
    _user2 = data["user2"];
    _valcapture2 = data["valcapture2"];
    _date2 = data["date2"];
    _location2 = data["location2"];
    _latitude2 = data["latitude2"];
    _longitude2 = data["longitude2"];
  }
  Map<String, dynamic> toMap() => {
        'id2': _id2,
        'user2': _user2,
        'valcapture2': _valcapture2,
        'date2': _date2,
        'location2': _location2,
        'latitude2': _latitude2,
        'longitude2': _longitude2,
      };
  int get id2 => _id2;
  String get user2 => _user2;
  String get valcapture2 => _valcapture2;
  String get date2 => _date2;
  String get location2 => _location2;
  String get latitude2 => _latitude2;
  String get longitude2 => _longitude2;
}
