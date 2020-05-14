import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    Color _primaryColor = Theme.of(context).primaryColor;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.network(
              snapshot.data['image'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: _primaryColor,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  snapshot.data['address'],
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Ver no mapa'),
                textColor: _primaryColor,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch(
                      'https://www.google.com/maps/search/?api=1&query=${snapshot.data['lat']},${snapshot.data['lon']}');
                },
              ),
              FlatButton(
                child: Text('Ligar'),
                textColor: _primaryColor,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch("tel:${snapshot.data['celphone']}");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
