import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime {
  String location;
  String time; // time in location
  String url; //
  String flag;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getData () async {
    try {
      Response resp = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(resp.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    }
    catch (error) {
      print('error is $error');
      time = 'couldnt find data';
    }
  }

}

