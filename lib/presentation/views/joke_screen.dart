import 'package:flutter/material.dart';
import 'package:joker/presentation/viewmodels/joke_viewmodel.dart';
import 'package:joker/presentation/views/splash_screen.dart';
import 'package:provider/provider.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    var jokeModel = context.read<JokeViewModel>().jokeModel;
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isTapped = true;
                  });
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const SplashScreen();
                    }));
                  });
                },
                child: Text(
                  jokeModel.setup,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: isTapped,
                child: Text(
                  jokeModel.punchline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
              )
            ]),
      ),
    );
  }
}
