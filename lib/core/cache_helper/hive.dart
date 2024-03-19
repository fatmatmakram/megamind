 import 'package:hive/hive.dart';
 import 'package:megamindd/feature/logic/models/responses_models/movie_details_model.dart';

import '../../feature/logic/adapters/adapter.dart';
 import '../../feature/logic/models/responses_models/movie_model.dart';




Future<void> initialiseHive() async {
  //key
  const movieKey = 'movies';
   //adapters
  Hive.registerAdapter(MovieAdapter());
   //box
  await Hive.openBox<MovieModel?>(movieKey);

}