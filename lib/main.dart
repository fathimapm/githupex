import 'package:flutter/material.dart';
import 'package:untitled5/src/app.dart';
import 'package:untitled5/src/helpers/api_helper.dart';

void main() {
  ApiHelper.initialize();
  runApp(const MyApp());
}