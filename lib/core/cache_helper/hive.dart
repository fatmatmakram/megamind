 import 'package:hive/hive.dart';

import '../../feature/logic/models/responses_models/movie_model.dart';
import 'adapter.dart';



Future<void> initialiseHive() async {
  //key
  const postsKey = 'movies';
  //adapters
  Hive.registerAdapter(MovieAdapter());
  //box
  await Hive.openBox<MovieModel?>(postsKey);

}