import 'package:flutter/material.dart';
import 'package:joker/services/get_joke_service.dart';
import 'package:joker/utils/locator.dart';

///Base view model with shared dependencies injected.
///All view models must extends this class.
class BaseViewModel extends ChangeNotifier {
  late JokeService jokeService;

  BaseViewModel({JokeService? jokeService}) {
    this.jokeService = jokeService ?? locator();
  }

  bool _loading = false;
  bool get loading => _loading;
  void toggleLoading(bool val) {
    _loading = val;
  }
}
