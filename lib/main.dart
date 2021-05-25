import 'package:covid_app_final/datasource.dart';
import 'package:covid_app_final/homepage.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),

    theme: ThemeData(
      primaryColor: primaryBlack
    ),


  ));
}