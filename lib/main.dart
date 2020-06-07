import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reddit_rss/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:reddit_rss/model/rssModel.dart';
import 'package:xml2json/xml2json.dart';

void main() async {
  String subredditFunny = "https://reddit.com/r/funny.rss";
  final Xml2Json xml2json = Xml2Json();

  // The response will contain xml document
  var response = await http.get(subredditFunny);
  if (response.statusCode == 200) {
    xml2json.parse(response.body);
    var jsonString = xml2json.toGData();
    // final Rss rss;
    var rss = Rss.fromJson(jsonDecode(jsonString));
    print('gdata');
    print(jsonString);
    print('');

    print('rss');
    print(rss.category);
    print('');

  } else {
    print('error occurred');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
