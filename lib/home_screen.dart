import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/number_quiz.dart';
import 'package:quiz_app/quiz_app_header.dart';

import 'calendar_quiz.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  HomeScreen({this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              QuizAppHeader(),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "Welcome, ",
                        style: GoogleFonts.playfairDisplay(
                            textStyle: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff231249))),
                        children: <TextSpan>[
                          TextSpan(
                            text: " $username !",
                            style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff231249))),
                          )
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Available Quiz",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(color: Colors.black, fontSize: 12.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.grey[900].withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NumberQuiz()));
                      },
                      splashColor: Color(0xffff6e40),
                      child: ListTile(
                        leading: Image(
                            image: AssetImage("assets/images/numbers.png")),
                        title: Text("Number System",
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))),
                        subtitle: Text("Difficulty: Basic",
                            style:
                                GoogleFonts.rubik(fontStyle: FontStyle.italic)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.grey[900].withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalendarQuiz()));
                      },
                      splashColor: Color(0xffff6e40),
                      child: ListTile(
                        leading:
                            Image(image: AssetImage("assets/images/abc.png")),
                        title: Text("Calender System",
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))),
                        subtitle: Text("Difficulty: Basic",
                            style:
                                GoogleFonts.rubik(fontStyle: FontStyle.italic)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
