// lib/main.dart
import 'package:flutter/material.dart';
import 'main_content.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate loading time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MainContent();
          }
        },
      ),
    );
  }
}

// New widget for main content

// lib/main_content.dart
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to My App',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'This is a one-page app.',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

// customized design

// lib/main_content.dart (continue)
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to My App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'This is a one-page app.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

