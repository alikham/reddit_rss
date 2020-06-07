import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<void> fetchRSSfeed() async {
  String subredditFunny = "https://reddit.com/r/funny.rss";

  // The response will contain xml document
  var response = await http.get(subredditFunny);
  if (response.statusCode == 200) {

    print('fetched');
  }else{
    print('error occurred');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Working'),
      ),
    );
  }
}
