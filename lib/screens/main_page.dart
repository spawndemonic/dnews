import 'package:flutter/material.dart';
import "../feed.dart";

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final sources = articles();
    return Scaffold(
      appBar: AppBar(
        title: Text('DNews'),
      ),
      body: Card(
          child: Column(
        children: <Widget>[
          
        ],
      )),
    );
  }
}
