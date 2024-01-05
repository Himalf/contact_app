import 'dart:io';
import 'package:contact/models/contact_model.dart';
import 'package:contact/models/lat_lng_model.dart';
import 'package:contact/pages/google_map_page.dart';
import 'package:contact/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() {
  // var path = Directory.current.path;
  // Hive
  //   ..init(path)
  //   ..registerAdapter(ContactModelAdapter as TypeAdapter)
  //   ..registerAdapter(LatLngModelAdapter as TypeAdapter);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GoogleMapPage(),
    );
  }
}
