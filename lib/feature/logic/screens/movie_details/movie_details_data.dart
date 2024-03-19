part of 'movie_details_imports.dart';

class MovieDetailsData {
  final GenericBloc<MovieDetailsModel?> movieDetailsCubit = GenericBloc(null);




  void fetchMovieDetailsData(BuildContext context, String movieId) async {
    if (await NetworkInfoImpl().isConected == false) {
      showSnackBar("No Internet Connection", backgroundColor: Colors.redAccent);

      movieDetailsCubit.onNetworkExeption( );
      return;
    } else {
      var data = await LogicHttpMethods().moviesDetails(movieId);
       movieDetailsCubit.onUpdateData(data);
     }
  }
}
