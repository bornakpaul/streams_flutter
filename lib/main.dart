import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streams',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
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

	late StreamController myStreamController = StreamController();
	late Stream myStream = myStreamController.stream.asBroadcastStream();

	late StreamSubscription mySubs;
	int data = 0;

	@override
  void initState() {
    
	mySubs = myStream.listen((event) { 
		setState(() {
		  data = event;
		});
	}, cancelOnError: false);

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
 
        child: Center(
          child: Text(
                'The data added is $data',
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
			myStreamController.sink.add(2);
		},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
