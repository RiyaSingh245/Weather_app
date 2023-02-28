import 'package:flutter/material.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/loading": (context) => const Loading(),
      },
    ),
  );
}
