import 'package:animations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class tryingAnimations extends StatefulWidget {
  const tryingAnimations({super.key});

  @override
  State<tryingAnimations> createState() => _tryingAnimationsState();
}

class _tryingAnimationsState extends State<tryingAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: Container(
          height: 250,
            width: 250,
          decoration: BoxDecoration(
            borderRadius:
              BorderRadius.all(Radius.circular(150)),
            color: Colors.grey[300],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Animations",
                    style: style1,
                  ),
                ).animate().fadeIn(duration: 5.seconds).scale(delay: 10.ms),
                Container(
                  child: Text(
                    "From",
                    style: style1,
                  ),
                ).animate().fadeIn(duration: 5.seconds).scale(delay: 1.seconds),
                Container(
                  child: Text(
                    "Everton",
                    style: style1,
                  ),
                ).animate().fadeIn(duration: 5.seconds).scale(delay: 2.seconds),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 5.seconds).scale(),
      ),
    );
  }
}
