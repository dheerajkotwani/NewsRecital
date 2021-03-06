import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_retic/Utilites/ApiKey.dart';
import 'package:news_retic/helper/ArticleData.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  int index;
  var url =
      "https://newsapi.org/v2/top-headlines?country=in&pageSize=30&apiKey=$apikey";
  var data;

  Future<String> getJsonData(url) async {
    var responce = await http.get(
      Uri.encodeFull(url),
    );

    setState(() {
      var convertdata = json.decode(responce.body);
      data = convertdata['articles'];
    });
    //  debugPrint(responce.body);
  }

  @override
  void initState() {
    getJsonData(url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: (data == null)
              ? CircularProgressIndicator()
              : SafeArea(child: ArticleData(data))),
    );
  }
}
