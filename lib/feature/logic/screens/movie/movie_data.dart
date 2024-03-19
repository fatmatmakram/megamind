part of 'movie_imports.dart';

class MovieData {
  late GenericBloc<List<MovieModel?>> homeCubit;
  late Box<MovieModel?> _postsBox;

  init() {
    homeCubit = GenericBloc([]);
    _postsBox = Hive.box<MovieModel?>('movies');
    getMovies();
    fetchAllLocalPosts();
  }

  Future<void> savePostsLocally({
    required List<MovieModel> posts,
  }) async {
    for (final post in posts) {
      await _postsBox.put(post.id, post);
    }
  }

  Future<List<MovieModel?>> fetchAllLocalPosts() async {
    final localPosts = _postsBox.values.toList();
    log("${localPosts.length.toString()} ;;;;;;;");
     return localPosts;
  }

  // static const MethodChannel _channel = MethodChannel('native_bridge');
  //
  // static Future<void> makeApiCall() async {
  //   try {
  //     await _channel.invokeMethod('makeApiCall');
  //   } on PlatformException catch (e) {
  //     log("Failed to make API call: '${e.message}'.");
  //   }
  // }

  void getMovies() async {
    homeCubit.onUpdateToInitState([]);
    if (await NetworkInfoImpl().isConected == false) {
      showSnackBar("noInternet".tr(), backgroundColor: Colors.redAccent);
      final local = await fetchAllLocalPosts();
      homeCubit.onUpdateData(local);
      return;
    } else {
      var res = await LogicRepository().getMovie();
      homeCubit.onUpdateData(res);
      savePostsLocally(posts: res).then((value) async {

       });
    }
  }
}
