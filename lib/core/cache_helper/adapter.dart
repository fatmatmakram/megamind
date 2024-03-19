 import 'package:hive/hive.dart';

import '../../feature/logic/models/responses_models/movie_model.dart';

class MovieAdapter extends TypeAdapter<MovieModel?>{
  @override
  final typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    return MovieModel(id:reader.read(),title:reader.read(),body:reader.read());
  }


  @override
  void write(BinaryWriter writer, MovieModel? obj) {


    writer.write(obj?.id,);
    writer.write(obj?.title);
    writer.write(obj?.body);}


}