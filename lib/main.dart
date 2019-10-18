import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:zuko/pages/aboutPage.dart';
import 'package:zuko/pages/cameraPage.dart';
import 'package:zuko/pages/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuko',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Zuko'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 1;

  final CameraPage _cameraPage = CameraPage();
  final AboutPage _aboutPage = AboutPage();
  final MainPage _mainPage = MainPage();

  Widget _showPage = new MainPage();

  Widget _pageChooser(int page){
    switch(page) {
      case 0:
        return _cameraPage;
        break;
      case 1:
        return _mainPage;
        break;
      case 2:
        return _aboutPage;
        break;
      default:
        return Container(
          child: new Center(
            child: new Text(
              'No page found',
              style: new TextStyle(fontSize: 30),
            ),
          )
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black38,
        color: Colors.black45,
        buttonBackgroundColor: Colors.black54,
        index: _pageIndex,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          //Icon(Icons.category, size: 30),
          Icon(Icons.camera_alt, size: 30),
          Icon(Icons.home, size: 30),
          //Icon(Icons.star, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (int tapped) {
          setState(() {
            _showPage = _pageChooser(tapped);
          });
        },
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: _showPage,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
