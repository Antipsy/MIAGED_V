import 'package:firebase_auth/firebase_auth.dart';

import 'Component.dart';
import 'package:flutter/material.dart';

import 'Toast.dart';
import 'login.dart';

class home extends StatefulWidget {
  final String name;
  const home({super.key, required this.name});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bcolor,
          automaticallyImplyLeading: false,
          title: Text(" MIAGED  "),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                }).onError((error, stackTrace) {
                  toastmessage(error.toString());
                });
              },
              icon: Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Text(
                  "Welcome to Home Screen",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: bcolor),
                ),
              ),
            ),
            Text(widget.name),
          ],
        ));
  }
}