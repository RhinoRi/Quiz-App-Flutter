import 'package:flutter/material.dart';

class QuizAppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff1E057F),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)),
          ),
        ),
        Positioned(
          top: 30,
          bottom: 20,
          right: 30,
          left: 30,
          child: Image.asset(
            "assets/icons/logo.png",
          ),
        )
      ],
    );
  }
}
