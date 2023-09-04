import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_app/bloc/tvoe_bloc.dart';
import 'package:test_repository/test_repository.dart';

import 'widgets/list_view_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvoeBloc, TvoeState>(
      builder: (context, state) {
        final List<CoverMainMovieModel> coverMoviesList = state.coverMovies;
        final List<CarouselMovieModel> carouselMoviesList = state.carouselMovies;

        if (!state.isLoaded) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: coverMoviesList.length,
                  itemBuilder: (context, index, realindex) {
                    return Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        SizedBox(
                          height: 488,
                          width: double.infinity,
                          child: Image.asset(
                            coverMoviesList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, -2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black,
                                blurStyle: BlurStyle.normal,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(coverMoviesList[index].nameOfMovieImage),
                              const SizedBox(height: 16),
                              Text(
                                coverMoviesList[index].discription,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 488,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 8),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _activeIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 64,
                  left: 16,
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.volume_off_outlined,
                      color: Color.fromRGBO(9, 9, 12, 0.3),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _activeIndex,
                  count: coverMoviesList.length,
                  effect: const JumpingDotEffect(
                    activeDotColor: Color.fromRGBO(151, 71, 255, 1),
                    dotHeight: 9,
                    dotWidth: 9,
                    dotColor: Color.fromRGBO(255, 255, 255, 0.1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 11, 0, 11),
              child: Text(
                'Продолжить просмотр',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: carouselMoviesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 0, 24),
                    child: ListViewItem(
                      currentSeries: carouselMoviesList[index].currentSeries,
                      currentViewingPosition: carouselMoviesList[index].currentViewingPosition,
                      image: carouselMoviesList[index].image,
                      nameOfMovie: carouselMoviesList[index].nameOfMovie,
                      currenSeason: carouselMoviesList[index].currenSeason,
                      currentTime: carouselMoviesList[index].currentTime,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 24),
              ),
            )
          ],
        );
      },
    );
  }
}
