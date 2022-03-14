import 'package:flutter/material.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({ Key? key }) : super(key: key);

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDDDDDD),
        elevation: 0,
        title: const Text(
          'Make me laugh',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
  }
}