import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/Worldtime.dart';

class ChooseLocations extends StatefulWidget {
  @override
  _ChooseLocationsState createState() => _ChooseLocationsState();
}

class _ChooseLocationsState extends State<ChooseLocations> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose the location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage('images/${locations[index].flag}'),),
              onTap: () {
                updateTime(index);
              },
            ),
          );
        },
      ),
    );
  }
}
