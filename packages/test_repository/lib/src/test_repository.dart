import 'package:test_repository/test_repository.dart';

class TestRepository {
  Future<List<CarouselMovieModel>> getCarouselData() async {
    await Future.delayed(const Duration(seconds: 3));

    final resoulList = <CarouselMovieModel>[];

    for (int i = 0; i < 8; i++) {
      resoulList.add(
        CarouselMovieModel(
          currentSeries: '${i + 1}',
          currentViewingPosition: i / 10,
          image: 'assets/thednesday.png',
          nameOfMovie: 'Уэнсдей',
          currenSeason: '1',
          currentTime: '12:35',
        ),
      );
    }
    return resoulList;
  }

  Future<List<CoverMainMovieModel>> getCoverData() async {
    await Future.delayed(const Duration(seconds: 3));

    final resultList = <CoverMainMovieModel>[];

    for (int i = 0; i < 5; i++) {
      resultList.add(
        const CoverMainMovieModel(
          discription:
              'Жители Хоукинса — дети, подростки и взрослые — сталкиваются с влиянием чуждого и опасного параллельного измерения.',
          image: 'assets/main_movie_image.png',
          nameOfMovieImage: 'assets/movie_name.png',
        ),
      );
    }
    return resultList;
  }
}
