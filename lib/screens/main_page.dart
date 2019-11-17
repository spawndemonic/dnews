import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
//import "../feed.dart";
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'dart:io';

 
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List _feed;
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
   articles() async{
     var client = new http.Client();
    //var file= File('source.txt');
    //var contents;
    //if(await file.exists()){
    //  contents = await file.readAsString();
    //}
  // RSS feed
  client.get("http://rss.nytimes.com/services/xml/rss/nyt/World.xml").then((response) {
    return response.body;
  }).then((bodyString) {
    var channel = new RssFeed.parse(bodyString);
    _feed = channel.items.toList();
  });
  }
}
