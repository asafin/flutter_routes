import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainScreen(),
        '/second': (BuildContext context) => SecondScreen()
      },
      onGenerateRoute: (routeSettings) {
        var path = routeSettings.name.split('/');

        if (path[1] == 'second') {
          return MaterialPageRoute(
              builder: (context) => SecondScreen(id: path[2]),
              settings: routeSettings);
        }
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Главное окно'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Открыть второе окно'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second/123');
              },
              child: Text('Открыть второе окно 123'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String _id;

  SecondScreen({String id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Второе окно $_id'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Назад'),
        ),
      ),
    );
  }
}
