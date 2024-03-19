
import 'package:flutter_test/flutter_test.dart';
import 'package:megamindd/feature/logic/logic_resources/logic_repo_imports.dart';
import 'package:megamindd/feature/logic/models/responses_models/movie_model.dart';


void main() {
  late LogicHttpMethods logicHttpMethods;

  setUp(() => {
  logicHttpMethods=LogicHttpMethods(
  ),
   });

  group("logicHttpMethods", () {
    group('fetchMovies', () {
      test("returned list of movies if status is 200", () async {

        final movies = await logicHttpMethods.getMovies();
        expect(movies, isA<List<MovieModel>>());
      });
    });
    // group('fetchDetailsMovie', () {
    //   test("returned details of movie if status is 200", () async {
    //
    //     final movieDet = await logicHttpMethods.moviesDetails(movieId);
    //     expect(movieDet, isA<MovieDetailsModel>());
    //   });
    // });
  });
}
