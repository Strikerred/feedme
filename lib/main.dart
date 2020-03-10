import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void fetchBusinessList() async {
    await DotEnv().load('.env');
    var response = await http.get('https://api.yelp.com/v3/businesses/search' +
        "?&latitude=49.2820&longitude=-123.1171",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${DotEnv().env['API_KEY']}"},
    );
    print(json.decode(response.body));
  }

  //This is the root of my aaplication
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Center(
        child: Text("Yelp Businesses"),
      ),
    );
  }
}

