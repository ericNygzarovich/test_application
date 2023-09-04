class CarouselMovieModel {
  final String currentTime;
  final String image;
  final String nameOfMovie;
  final String currentSeries;
  final String currenSeason;
  final double currentViewingPosition;

  const CarouselMovieModel({
    required this.currenSeason,
    required this.currentSeries,
    required this.currentTime,
    required this.currentViewingPosition,
    required this.image,
    required this.nameOfMovie,
  });
}
