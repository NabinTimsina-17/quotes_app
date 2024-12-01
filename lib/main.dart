// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/view/home_page.dart';
import 'package:quotes_app/view_model/home_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
