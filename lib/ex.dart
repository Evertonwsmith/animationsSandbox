import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<double> _animation1;

  late AnimationController _controller2;
  late Animation<double> _animation2;

  late AnimationController _controller3;
  late Animation<double> _animation3;

  bool selected = false;
  bool selected2 = false;

  @override
  void initState() {
    super.initState();

    // First circle
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation1 = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller1.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller1.forward();
      }
    });

    // Second circle
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation2 = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller2.forward();
      }
    });

    // Third circle
    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation3 = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller3.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller3.forward();
      }
    });

    // Start the animations with different delays
    _controller1.forward();
    Future.delayed(Duration(milliseconds: 25), () {
      _controller2.forward();
    });
    Future.delayed(Duration(milliseconds: 50), () {
      _controller3.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: selected ? Text('AnimatedContainer Example') : Text('AnimatedContainer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Build a row of bouncing circles
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBouncingCircle(Colors.blue[200]!, _animation1),
              _buildBouncingCircle(Colors.blue[400]!, _animation2),
              _buildBouncingCircle(Colors.blue[600]!, _animation3),
            ],
          ),

          Container(
            width: 200,
            height: 50,
          ),

          // AnimatedContainer with GestureDetector
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: _buildAnimatedContainer(selected, Alignment.center, FlutterLogo(size: 10)),
          ),

          Container(
            width: 200.0,
            height: 20.0,
            alignment: AlignmentDirectional.bottomCenter,
            child: Text(''),
          ),

          // Another AnimatedContainer with GestureDetector
          GestureDetector(
            onTap: () {
              setState(() {
                selected2 = !selected2;
              });
            },
            child: _buildAnimatedContainer(selected2, Alignment.center, const FlutterLogo(size: 100)),
          ),
        ],
      ),
    );
  }

  // Helper method to build a bouncing circle
  Widget _buildBouncingCircle(Color color, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundColor: color,
            ),
          ),
        );
      },
    );
  }

  // Helper method to build AnimatedContainer with GestureDetector
  Widget

  _buildAnimatedContainer(bool isSelected, Alignment alignment, Widget child) {
    return Center(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: isSelected ? BorderRadius.all(Radius.circular(50)) : BorderRadius.all(Radius.circular(0)),
          color: isSelected ? Colors.red : Colors.blue,
        ),
        width: isSelected ? 200.0 : 200.0,
        height: isSelected ? 90.0 : 120.0,
        alignment: isSelected ? alignment : AlignmentDirectional.bottomCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
}
