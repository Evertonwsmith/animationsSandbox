import 'dart:math';

import 'package:animations/transitions/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class customButtons extends StatefulWidget {
  // final bool pressed;
  final String text;
  final Widget destination;

  customButtons({super.key, required this.text, required this.destination});

  @override
  State<customButtons> createState() => _customButtomsState();
}

class _customButtomsState extends State<customButtons> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    style st = new style();
    return Expanded(
      child: GestureDetector(
        onLongPressDown: (context) {
          setState(() {
            pressed = true;
          });
        },
        onLongPressCancel: () {
          setState(() {
            pressed = false;
          });
        },
        onLongPressUp: () {
          setState(() {
            pressed = false;
            Navigator.of(context).push(_createRoute(widget.destination));
          });
        },
        onTap: () {
          Navigator.of(context).push(_createRoute(widget.destination));
        },
        child: AnimatedContainer(
          duration: 1.milliseconds,
          decoration: BoxDecoration(
            border: Border.all(
              color: pressed ? st.borderPressed : st.textColor,
            ),
            borderRadius: BorderRadius.circular(50),
            color: pressed ? st.boxedPressed : st.backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              widget.text,
              style: pressed ? st.gstyle2Pressed : st.gstyle2,
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInQuint;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class customRow extends StatelessWidget {
  String titleText;
  Widget destination;

  customRow({super.key, required this.titleText, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          width: 30,
          height: 30,
          child: iconList[Random().nextInt(4)],
        ),
        SizedBox(
          width: 20,
        ),
        customButtons(text: titleText, destination: destination),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

List<Icon> iconList = [
  Icon(LineIcons.dragon, color: Colors.white, size: 30),
  Icon(FontAwesomeIcons.dragon, color: Colors.white, size: 30),
  Icon(LineIcons.hippo, color: Colors.white, size: 30),
  Icon(FontAwesomeIcons.hippo, color: Colors.white, size: 30)
];
