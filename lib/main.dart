import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
   Magic8Ball()
);

class Magic8Ball extends StatelessWidget {
  const Magic8Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade600,
        appBar: Magic8BallAppBar(),
        body: Magic8BallBody(),
      ),
    );
  }
}

class Magic8BallBody extends StatefulWidget {
  const Magic8BallBody({super.key});

  @override
  State<Magic8BallBody> createState() => _Magic8BallBodyState();
}

class _Magic8BallBodyState extends State<Magic8BallBody> {
  int ballNumber = 1;

  void updateState() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: updateState,
        child: Image.asset('images/ball${ballNumber}.png'),
      ),
    );
  }
}

class Magic8BallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const Magic8BallAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade900,
      title: Center(
        child: Text(
          'Ask Me Anything',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}