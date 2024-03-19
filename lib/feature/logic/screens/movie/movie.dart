part of 'movie_imports.dart';

class Movies extends StatefulWidget {
  const Movies({
    Key? key,
  }) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  MovieData movieData = MovieData();

  @override
  void initState() {
    super.initState();

    movieData.init();
  }

   @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          centerTitle: true,
          leading: const SizedBox(),
          title: Text(
            'Movies',
            style: TextStyleManager.appBarStyle
                .copyWith(color: ColorManager.white),
          ),
        ),
        body: ListView(children: [
          BlocBuilder<GenericBloc<List<MovieModel?>>,
              GenericState<List<MovieModel?>>>(
            bloc: movieData.homeCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                if (state.data.isNotEmpty) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          BuildMovieItem(state.data[index]!));
                } else {
                  return const StatesList(
                    type: TypeEnum.empty,
                  );
                }
              } else if (state is GenericNetworkExeptionState) {
                return const StatesList(
                  type: TypeEnum.noInterNet,
                  msg: '',
                );
              } else if   (state is GenericLoadingState){
                return CustomLoading.showLoadingView(
                    color: ColorManager.primary);
              }else{
              return  const SizedBox.shrink();
              }
            },
          ),
        ]),
      ),
    );
  }


}
