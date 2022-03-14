import 'package:joker/models/joke_model.dart';
import 'package:joker/remote/get_joke_repo.dart';

abstract class JokeService {
  Future<JokeModel> getJoke();
}

class JokeServiceImpl implements JokeService {
  final JokeRepository jokeRepo;

  JokeServiceImpl({required this.jokeRepo});
  @override
  Future<JokeModel> getJoke() async {
    var res = await jokeRepo.getJoke();
    return res;
  }
}
