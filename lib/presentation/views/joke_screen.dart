import 'package:flutter/material.dart';
import 'package:joker/presentation/viewmodels/joke_viewmodel.dart';
import 'package:provider/provider.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen>
    with SingleTickerProviderStateMixin {
  bool isTapped = false;
  late AnimationController animationController;
  double animationValue = 0;

  @override
  void initState() {
    super.initState();
    context.read<JokeViewModel>().getRandomJoke();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationController.addListener(() {
      setState(() {
        animationValue = animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var jokeVM = context.read<JokeViewModel>();
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
      body: context.watch<JokeViewModel>().loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            )
          : Container(
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
                        animationController.forward();
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            isTapped = false;
                          });
                          animationController.reset();
                          jokeVM.getRandomJoke();
                        });
                      },
                      child: Text(
                        jokeVM.jokeModel.setup,
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
                      child: SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(1, 0.5),
                                end: const Offset(0, 0))
                            .animate(animationController),
                        child: Opacity(
                          opacity: animationValue,
                          child: Text(
                            jokeVM.jokeModel.punchline,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
    );
  }
}
