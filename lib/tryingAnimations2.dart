import 'package:animations/tryAnimations2Dir/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class tryingAnimations2 extends StatefulWidget {
  const tryingAnimations2({super.key});

  @override
  State<tryingAnimations2> createState() => _tryingAnimations2State();
}

class _tryingAnimations2State extends State<tryingAnimations2>
    with TickerProviderStateMixin {
  bool cat1 = false;
  bool cat2 = false;
  bool cat3 = false;
  int secretCount = 0;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;

  @override
  void initState() {
    super.initState();
    initializeControllers();
    initializeAnimations();
    startAnimations();
  }

  void initializeControllers() {
    _controller1 = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    _controller3 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _controller4 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  void initializeAnimations() {
    _animation1 = Tween<double>(begin: -.25 * 3.14, end: .25 * 3.14)
        .animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInOut,
    )..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller1.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller1.forward();
            }
          }));

    _animation2 = Tween<double>(begin: -.25 * 3.14, end: .25 * 3.14)
        .animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    )..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller2.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller2.forward();
            }
          }));

    _animation3 = Tween<double>(begin: 0, end: 30).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.decelerate,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller3.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller3.forward();
        }
      }));

    _animation4 = Tween<double>(begin: 0, end: 30).animate(_controller4);
  }

  void startAnimations() {
    _controller1.forward();
    _controller2.forward();
    _controller3.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text("Animations"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[400]),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: _controller3,
                    builder: (context, child) {
                      return Transform.scale(
                          scale: 1,
                          child: Container(
                              width: 300,
                              height: 300,
                              child: Center(
                                child: Text(
                                  'Haley\'s Animation',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: 10 < _animation3.value &&
                                            _animation3.value < 20
                                        ? Colors.blue[300]
                                        : _animation3.value > 27
                                            ? Colors.blue[900]
                                            : Colors.blue[600],
                                    fontSize:
                                        cat1 && cat2 ? _animation3.value : 0,
                                  ),
                                ),
                              )));
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cat1 = !cat1;
                        });
                      },
                      child: AnimatedBuilder(
                          animation: _animation1,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: cat1 == true ? _animation1.value : 0,
                              child: Container(
                                width: 150,
                                height: 150,
                                child: Image.asset('images/cat1.png'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[600],
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10)
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cat2 = !cat2;
                        });
                      },
                      child: AnimatedBuilder(
                          animation: _animation2,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: cat2 == true ? _animation2.value : 0,
                              child: Container(
                                width: 150,
                                height: 150,
                                child: Image.asset('images/cat2.png'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[600],
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10)
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        secretCount++;
                        if (secretCount == 10) {
                          _controller4.forward();
                        }
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.elasticIn,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[600],
                        ),
                        child: Center(
                          child: Text(
                            'click',
                            style: TextStyle(
                                color: secretCount % 2 == 0
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        )
                        // child: Container(
                        //     width: 300,
                        //     height: 300,
                        //     child: Center(child: Text(";)")),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(50),
                        //     ))
                        )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                              secretCount == 69
                                  ? 'NICE!'
                                  : secretCount > 69
                                      ? 'SURPRISE'
                                      : '',
                              style: mainTextStyle),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }
}
