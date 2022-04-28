import 'package:flutter/material.dart';
import 'package:quiz_app/score.dart';

import 'alphabet_quest.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_app_header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalendarQuiz extends StatefulWidget {
  @override
  _CalendarQuizState createState() => _CalendarQuizState();
}

class _CalendarQuizState extends State<CalendarQuiz> {
  double _length = 0.0;
  var currentQuest = 0;

  questIndicator() {
    String qnumber = (_length * 5).toString()[0];

    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: 10.0,
          value: _length,
          valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
          backgroundColor: Color(0xffF9CA54),
        ),
        RichText(
          text: TextSpan(
              text: "$qnumber",
              style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff231249))),
              children: <TextSpan>[
                TextSpan(
                  text: " / 5",
                  style: GoogleFonts.playfairDisplay(
                      textStyle:
                          TextStyle(fontSize: 20.0, color: Color(0xff231249))),
                )
              ]),
        ),
      ],
    );
  } // this is to know which question is user at.

  Future<AlphaQuestion> alphaQuest;

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  Future<List<AlphaQuestion>> getQuestions() async {
    var apiUrl =
        Uri.parse("http://perceptiondraft.com/api/gbas00721-quiz.php?cid=2");
    var response = await http.get(apiUrl);

    List<dynamic> data = jsonDecode(response.body);
    List<AlphaQuestion> alphaQuest =
        data.map((data) => AlphaQuestion.fromJson(data)).toList();

    return alphaQuest;
  }

  bool isSelected = false;
  int score = 0;
  checkAnswer() {
    if (isSelected = true) {
      score = score + 1;
      return score;
    }
  }

  changeQuestion(userScore) {
    (currentQuest <= 4)
        ? currentQuest = currentQuest + 1
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FinalScore(
                finalScore: userScore,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff1E057F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuizAppHeader(),
            SizedBox(
              height: 0.5,
            ),
            Container(
              height: 55.0,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff1E057F),
              child: Center(
                child: Text(
                  "Calendar System",
                  style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            questIndicator(),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: FutureBuilder<List<AlphaQuestion>>(
                  future: getQuestions(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Center(
                            child: Text(
                              snapshot.data.elementAt(currentQuest).q,
                              style: TextStyle(
                                  fontSize: 23.0, color: Colors.black),
                            ),
                          )
                        : CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(Color(0xff1E057F)),
                          );
                  }),
            ),
            SizedBox(
              height: 15.0,
            ),
            FutureBuilder<List<AlphaQuestion>>(
              future: getQuestions(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          snapshot.data.elementAt(currentQuest).o1,
                          snapshot.data.elementAt(currentQuest).o2,
                          snapshot.data.elementAt(currentQuest).o3,
                          snapshot.data.elementAt(currentQuest).o4
                        ].map((options) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff1E057F), // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {
                                  var crctans =
                                      snapshot.data.elementAt(currentQuest).co;
                                  if (options == crctans) {
                                    print("Right");
                                    setState(() {
                                      isSelected = true;
                                      checkAnswer();
                                    });
                                  } else {
                                    print("Wrong");
                                  }
                                },
                                label: Center(
                                    child: Text(
                                  options.toString(),
                                  style: TextStyle(fontSize: 20.0),
                                )),
                                icon: Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                )),
                          );
                        }).toList(),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xff1E057F)),
                      );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange[600], // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    setState(() {
                      _length = _length + 0.2;
                      changeQuestion(score);
                    });
                  },
                  child: Text("NEXT")),
            ),
            Text(
              "Your score till now: $score",
              style: TextStyle(fontSize: 20.0, color: Color(0xff1E057F)),
            ),
            FutureBuilder(
                future: getQuestions(),
                builder: (context, snapshot) {
                  return snapshot.hasError
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Your wifi/data might be off"),
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(""),
                        );
                })
          ],
        ),
      ),
    );
  }
}
