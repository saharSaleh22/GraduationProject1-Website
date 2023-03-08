import 'package:flutter/material.dart';
import 'package:web_page/screens/coachHome.dart';
import 'package:web_page/screens/dashCoach.dart';
import 'package:web_page/screens/dashboard_screen.dart';
import 'package:web_page/ui/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DashboardScreen2(),
    );
  }
}
