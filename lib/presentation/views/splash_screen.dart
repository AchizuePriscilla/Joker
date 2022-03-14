import 'package:flutter/material.dart';
import 'package:joker/presentation/views/joke_screen.dart';
import 'package:provider/provider.dart';
import 'package:joker/presentation/viewmodels/joke_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getRandomJoke();
  }

  getRandomJoke() async {
    await context.read<JokeViewModel>().getRandomJoke().then((value) =>
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const JokeScreen();
        })));
  }

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
