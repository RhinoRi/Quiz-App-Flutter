import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/home_screen.dart';

class FinalScore extends StatefulWidget {
  final int finalScore;
  FinalScore({Key key, this.finalScore}) : super(key: key);
  @override
  _FinalScoreState createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff231249),
      body: Padding(
        padding: EdgeInsets.only(top: 200.0, bottom: 200.0),
        child: Column(
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                    text: "Your Final Score :  ",
                    style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.finalScore.toString(),
                        style: GoogleFonts.playfairDisplay(
                            textStyle: TextStyle(
                                fontSize: 30.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, // background
                    onPrimary: Color(0xff231249) // foreground
                    ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen()
                      ));
                },
                child: Text("Home"))
          ],
        ),
      ),
    );
  }
}
