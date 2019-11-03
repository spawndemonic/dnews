import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import "../feed.dart";

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List<dynamic> _feed = articles();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DNews'),
      ),
      body: Column(
        children: [
          Column(
            children: _feed
                .map((element) => Card(
                      child: Column(
                        children: <Widget>[
                          Text(element.title),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
