import 'package:animations/ex.dart';
import 'package:animations/transitions/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animations/transitions/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';


class transistions extends StatefulWidget {
  const transistions({super.key});

  @override
  State<transistions> createState() => _transistionsState();
}

class _transistionsState extends State<transistions> {
  style st = new style();
  bool pressed1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Transitions",
            style: st.gstyle1,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: st.backgroundColor,
          leading: IconButton(
            icon: Icon(LineIcons.otter,
            color: st.textColor,
            size: 50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: st.backgroundColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              customRow(destination: AnimatedContainerExample(), titleText: 'Page One'),
              SizedBox(
                height: 30,
              ),
              customRow(destination: AnimatedContainerExample(), titleText: 'Page Two'),
              SizedBox(
                height: 30,
              ),
              customRow(destination: AnimatedContainerExample(), titleText: 'Ex'),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
