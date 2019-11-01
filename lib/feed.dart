import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'dart:io';
 articles() async{
     var client = new http.Client();
    var file= File('source.txt');
    var contents;
    if(await file.exists()){
      contents = await file.readAsString();
    }
  // RSS feed
  client.get("http://rss.nytimes.com/services/xml/rss/nyt/World.xml").then((response) {
    return response.body;
  }).then((bodyString) {
    var channel = new RssFeed.parse(bodyString);
    return channel.items;
  });
  }
 