part of 'tvoe_bloc.dart';

class TvoeState {
  List<CoverMainMovieModel> coverMovies;
  List<CarouselMovieModel> carouselMovies;
  bool isLoaded;

  TvoeState({
    this.carouselMovies = const [],
    this.coverMovies = const [],
    this.isLoaded = false,
  });

  TvoeState copyWith(
    List<CoverMainMovieModel>? newCoverMovies,
    List<CarouselMovieModel>? newCarouselMovies,
    bool? isLoadedFlag,
  ) {
    return TvoeState(
      carouselMovies: newCarouselMovies ?? carouselMovies,
      coverMovies: newCoverMovies ?? coverMovies,
      isLoaded: isLoadedFlag ?? isLoaded,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is TvoeState &&
      carouselMovies.length == other.carouselMovies.length &&
      coverMovies.length == other.coverMovies.length &&
      runtimeType == other.runtimeType;

  @override
  int get hashCode => coverMovies.hashCode;
}
