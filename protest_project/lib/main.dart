import 'package:flutter/material.dart';
import 'google_apis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),

    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String eventData = '';

  void updateEventData(String data) {
    setState(() {
      eventData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Your App Title')),
      body: Column(
        children: [
          ProtestText(),

          Expanded(
            child: SearchBarApp(),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              updateEventData('New Event Created!');
            },
            child: Text('Create Event'),
          ),
          SizedBox(height: 16),
          Text('Event Data: $eventData'),
          YourCustomContainer(),
        ],
      ),
    );
  }
}

class ProtestText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: Text(
        'Protest',
        style: TextStyle(
          fontFamily: 'Lilita One',
          fontSize: 70,
          fontWeight: FontWeight.w400,
          height: 1.1425,
          color: Color(0xff6b3d08),
        ),
      ),
    );
  }
}

class LineContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 3,
      color: Colors.black,
    );
  }
}

class YourCustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffe3cf),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Your Custom Content'),
        ],
      ),
    );
  }
}

class SearchBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
