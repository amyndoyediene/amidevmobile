import 'package:amimobile/pages/contactList.dart';
import 'package:amimobile/pages/detailContact.dart';
import 'package:amimobile/pages/formulaire.dart';
import 'package:amimobile/pages/bienvenu.dart';
import 'package:amimobile/pages/fileList.dart';
import 'package:amimobile/pages/imagePage.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/formulaire': (context) => Home(),
        '/contactList': (context) => ContactList(),
        '/detailContact': (context) => DetailContact(),
        '/fileList': (context) => FileList(),
        '/imagePage': (context) => ImagePage()
      },
    );
  }
}
