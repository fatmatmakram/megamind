// ignore_for_file: use_build_context_synchronously, file_names

part of 'logic_repo_imports.dart';

class LogicHttpMethods {


  LogicHttpMethods( );

  Future<List<MovieModel>> getMovies() async {
    var result = await GenericHttp<MovieModel>().callApi(
      name:
          ApiNames.movies,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data['results'],
      toJsonFunc: (json) => MovieModel.fromMap(json),
    );
    return result;
  }

  Future<MovieDetailsModel> moviesDetails(String movieId) async {
    var result = await GenericHttp<MovieDetailsModel>().callApi(
      name:
          "${ApiNames.movieDetails}/$movieId",
      returnType: ReturnType.Model,
      showLoader: false,
      methodType: MethodType.Get,
      toJsonFunc: (json) => MovieDetailsModel.fromJson(json),
      returnDataFun: (data) {
        if (data != null) {
          return data;
        }
      },
    );
    return result;
  }
}
