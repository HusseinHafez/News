// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    getData();
    super.initState();
  }
   var business =[];
  void getData()async{
    final response= await Dio().get('https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=63a36b09ffad4a5689aedbde2f91a8e9');
    print(response);
    business=response.data['articles'] ;
    print(business);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('.',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
    );
  }
}