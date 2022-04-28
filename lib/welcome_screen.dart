import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final namecontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                "assets/icons/icon.png",
                height: 100.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Welcome to Quiz",
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff231249))),
              ),
              Material(
                child: TextField(
                  controller: namecontoller,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'your name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xff231249))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Color(0xff231249), width: 3.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 250.0,
              ),
              FloatingActionButton(
                backgroundColor: Color(0xff231249),
                onPressed: () {
                  var value = namecontoller.text;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          username: value,
                        ),
                      ));
                },
                child: Icon(CupertinoIcons.rocket_fill),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
