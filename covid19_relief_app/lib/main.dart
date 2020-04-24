import 'package:covid19_relief_app/pages/login.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
       MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        home: Login(),
      ));
}

