import 'package:flutter/material.dart';
import 'package:mobile_pdam/router_generator.dart';
import 'package:mobile_pdam/views/login/login_view.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      builder: OneContext().builder,
      initialRoute: "/loginView",
      onGenerateRoute: RouterGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
