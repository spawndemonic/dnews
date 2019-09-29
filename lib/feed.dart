import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class Feed {
  //make call to jason file for all sources
  //send the array of articles to articles function

  articles(){
    var client = new http.Client();
    // RSS feed
    //update bottom line to gather all articles froma ll sources
    client.get("http://rss.nytimes.com/services/xml/rss/nyt/World.xml").then((response) {
      return response.body;
    }).then((bodyString) {
      var channel = new RssFeed.parse(bodyString);
      return channel;
    });
  }
}