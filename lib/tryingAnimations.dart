import 'package:animations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class tryingAnimations extends StatefulWidget {
  const tryingAnimations({super.key});

  @override
  State<tryingAnimations> createState() => _tryingAnimationsState();
}

class _tryingAnimationsState extends State<tryingAnimations>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerString;
  late Animation<double> animation;
  late Animation<String> animationString;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controllerString = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // animation = Tween(begin: 0,end: 100)

    controller.forward();
    controllerString.forward();

  }

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
            borderRadius: BorderRadius.all(Radius.circular(150)),
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
                ).animate().fadeIn(duration: 2.seconds).scale(delay: 10.ms),
                Container(
                  child: Text(
                    "From",
                    style: style1,
                  ),
                ).animate().fadeIn(duration: 2.seconds).scale(delay: 1.seconds),
                Container(
                  child: Text(
                    "Everton",
                    style: style1,
                  ),
                ).animate().fadeIn(duration: 2.seconds).scale(delay: 2.seconds),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 5.seconds).scale(),
      ),
    );
  }
}
