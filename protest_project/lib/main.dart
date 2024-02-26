import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const AuthPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
          Row(
            children: [
              const ProtestText(),
              const SizedBox(width: 16), // Add spacing between ProtestText and SearchBarApp
              Expanded(
                child: const SearchBarApp(),
              ),
            ], // Added closing bracket for Row children
          ), // Added closing bracket for Row
          const YourCustomContainer(),
          const SizedBox(height: 16),
          Spacer(), // Spacer pushes everything above downwards
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
              // Show the CreateEventBox
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CreateEventBox(); // Assuming CreateEventBox is a StatefulWidget or StatelessWidget
                },
              );
            },
            child: const Text('Create Event'),
          ),
          const SizedBox(height: 16),
          Text('Event Data: $eventData'),
          // Add some space
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
  const YourCustomContainer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        decoration: BoxDecoration(
          color: const Color(0xffffe3cf),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
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
            Text('Search Result'),
          ],
        ),
      ),
    );
  }
}



class SearchBarApp extends StatelessWidget {
  const SearchBarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Set border radius here
          ),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class CreateEventBox extends StatelessWidget {
  const CreateEventBox({Key? key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, // Align to the top edge of the screen
      right: 0, // Align to the right edge of the screen
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.all(300),
          decoration: BoxDecoration(
            color: const Color(0xffffe3cf),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 2),
                blurRadius: 3,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create the event down below:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}

