import 'package:get_it/get_it.dart';
import 'package:joker/remote/get_joke_repo.dart';
import 'package:joker/services/get_joke_service.dart';
GetIt locator = GetIt.instance;

Future<void> setupLocator({String baseApi = 'https://joke.api.gkamelo.xyz/'}) async {
  //Services
  locator.registerLazySingleton<JokeService>(
    () => JokeServiceImpl(
      jokeRepo: locator()
    ),
  );

//repos
  locator.registerLazySingleton<JokeRepository>(
    () => JokeRepositoryImpl(baseApi),
  );
}
