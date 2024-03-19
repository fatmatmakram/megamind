part of 'movie_details_imports.dart';

class MovieDetails extends StatefulWidget {
  final String movieId;

  const MovieDetails({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsData movieDetailsData = MovieDetailsData();

  @override
  void initState() {
    movieDetailsData.fetchMovieDetailsData(context, widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

        body: BlocBuilder<GenericBloc<MovieDetailsModel?>,
                GenericState<MovieDetailsModel?>>(
            bloc: movieDetailsData.movieDetailsCubit,
            builder: (context, infoState) {
              if (infoState is GenericUpdateState) {
                return ListView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
                      child: Column(children: [
                        BuildMovieItem(
                          orderDetailsModel:
                              movieDetailsData.movieDetailsCubit.state.data!,
                          txt: movieDetailsData
                                  .movieDetailsCubit.state.data!.title ??
                              '',
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        BuildDesc(
                          txt: "description : ",
                          desc: infoState.data?.overview ?? '',
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              } else if (infoState is GenericNetworkExeptionState) {
                return const StatesList(
                  type: TypeEnum.noInterNet,
                );
              } else {
                return CustomLoading.showLoadingView();
              }
            }));
  }
}
