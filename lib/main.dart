import 'package:amimobile/pages/contactList.dart';
import 'package:amimobile/pages/detailContact.dart';
import 'package:amimobile/pages/formulaire.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/contactList': (context) => ContactList(),
        '/detailContact': (context) => DetailContact(),
      },
    );
  }
}
