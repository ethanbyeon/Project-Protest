import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          if (user != null)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text(
                    user!.email!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: signOut,
                    icon: const Icon(Icons.logout),
                    tooltip: "Sign Out",
                  ),
                ],
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          const ProtestText(),
          const Expanded(
            child: SearchBarApp(),
          ),
          const SizedBox(height: 16),
          if (user == null)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                );
              },
              child: const Text("Login"),
            ),
        ],
      ),
    );
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      user = null;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
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

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
