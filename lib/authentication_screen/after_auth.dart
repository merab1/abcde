import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfterAuth extends StatefulWidget {
  AfterAuth({Key? key}) : super(key: key);
  static const String pathId = 'Welcome Page';
  @override
  State<AfterAuth> createState() => _AfterAuthState();
}

class _AfterAuthState extends State<AfterAuth> {
  String welcomeScreen = 'Welcome to the club';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text('Welcome'),
            ),
            ListTile(
              title: const Text('Bonjour',),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Bonjour';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Hello'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Hello';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Guten Tag'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Guten Tag';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Au Revoir'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Au Revoir';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chao Bambino'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Chao Bambino';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(welcomeScreen),
      ),
    );
  }
}
