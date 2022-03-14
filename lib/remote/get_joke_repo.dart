import 'package:joker/models/joke_model.dart';
import 'package:joker/utils/remote_util.dart';

abstract class JokeRepository {
  Future<JokeModel> getJoke();
}

class JokeRepositoryImpl extends Remote implements JokeRepository {
  JokeRepositoryImpl(String url) : super(url);

  @override
  Future<JokeModel> getJoke() async {
    var response =
        await dio.get("jokes/random");
    return JokeModel.fromMap(response.data);
  }
}
