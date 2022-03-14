import 'package:joker/models/joke_model.dart';
import 'package:joker/presentation/viewmodels/base_view_model.dart';

class JokeViewModel extends BaseViewModel {
  late JokeModel jokeModel;
  Future<void> getRandomJoke() async {
    toggleLoading(true);
    var result = await jokeService.getJoke();
    jokeModel = result;
    notifyListeners();
    toggleLoading(false);
  }
}
