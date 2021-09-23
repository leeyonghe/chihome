import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChiHome',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.white,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(child: Image(image: AssetImage('images/logo.jpg')), width: 300, height: 300,),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}