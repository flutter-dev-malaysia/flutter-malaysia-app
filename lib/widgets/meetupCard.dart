import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeetupCard extends StatelessWidget {
  const MeetupCard({this.photoUrl, this.title, this.date});

  final String photoUrl;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[900],
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AdvancedNetworkImage(
                  photoUrl,
                  useDiskCache: true,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 10, right: 8, bottom: 7),
                child: Icon(
                  FontAwesomeIcons.calendarAlt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
    );
  }
}
