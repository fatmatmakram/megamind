part of 'movie_details_imports.dart';

class MovieDetailsData {

  final GenericBloc<MovieDetailsModel?> movieDetailsCubit = GenericBloc(null);

  void fetchMovieDetailsData(BuildContext context, String movieId) async {
    if (await NetworkInfoImpl().isConected == false) {
      showSnackBar("no Internet",
          backgroundColor: Colors.redAccent);
      movieDetailsCubit.onNetworkExeption();
      return;
    } else {
      var data = await LogicHttpMethods().moviesDetails(movieId);
      log("${data}nnnnnnnn");
      movieDetailsCubit.onUpdateData(data);
    }
  }
}
