import 'package:animations/ex.dart';
import 'package:animations/transitions/transitions.dart';
import 'package:animations/tryingAnimations.dart';
import 'package:animations/tryingAnimations2.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed:
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedContainerExample())),
                child: Text("Example Animations"),
            ),
            ElevatedButton(onPressed:
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => tryingAnimations())),
              child: Text("Everton's Animations"),
            ),
            ElevatedButton(onPressed:
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => tryingAnimations2())),
              child: Text("Haley's Animations"),
            ),
            ElevatedButton(onPressed:
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => transistions())),
              child: Text("Transisions"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 300,
              width: 300,
              child: const FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }


}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}