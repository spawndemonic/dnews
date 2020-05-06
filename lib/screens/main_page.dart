import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
//import "../feed.dart";
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'dart:io';

 
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<RssItem> _feed;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DNews'),
      ),
      body: FutureBuilder(
        future:articles(),
      
      ),
    );
  }
  
  
  
  
  
  
  
  
  
  
   articles() async{
     var client = new http.Client();
  return client.get("http://rss.nytimes.com/services/xml/rss/nyt/World.xml").then((response) {
    return response.body;
  }).then((bodyString) {
    var channel = new RssFeed.parse(bodyString);
    return channel.items.toList();
  });
  }
}
