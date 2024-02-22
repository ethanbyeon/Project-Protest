import 'package:flutter/material.dart';
import 'package:protest_project/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String eventData = '';

  void updateEventData(String data) {
    setState(() {
      eventData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProtestText(),
          const Expanded(
            child: SearchBarApp(),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to LoginPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Text('Go to Login'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              updateEventData('New Event Created!');
            },
            child: const Text('Create Event'),
          ),
          const SizedBox(height: 16),
          Text('Event Data: $eventData'),
          const YourCustomContainer(),
          const SizedBox(height: 16), // Add some space
        ],
      ),
    );
  }
}

class ProtestText extends StatelessWidget {
  const ProtestText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: const Text(
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

class YourCustomContainer extends StatelessWidget {
  const YourCustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffe3cf),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Your Custom Content'),
        ],
      ),
    );
  }
}

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
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
