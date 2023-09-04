import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/list_view_item.dart';

final imageURL = <String>[
  'https://lotofsense.com/ru/wp-content/uploads/2023/06/aaaabe1qvcdxknxg3hzpcuxwhmhhlr4ie9ya9zccfe04mcvetwdz4a69d-1lmkql14semyzuuztao5n8sgemvy_vqyafbaran2m8o3zc.jpg',
  'https://lotofsense.com/ru/wp-content/uploads/2023/06/aaaabe1qvcdxknxg3hzpcuxwhmhhlr4ie9ya9zccfe04mcvetwdz4a69d-1lmkql14semyzuuztao5n8sgemvy_vqyafbaran2m8o3zc.jpg',
  'https://lotofsense.com/ru/wp-content/uploads/2023/06/aaaabe1qvcdxknxg3hzpcuxwhmhhlr4ie9ya9zccfe04mcvetwdz4a69d-1lmkql14semyzuuztao5n8sgemvy_vqyafbaran2m8o3zc.jpg',
  'https://lotofsense.com/ru/wp-content/uploads/2023/06/aaaabe1qvcdxknxg3hzpcuxwhmhhlr4ie9ya9zccfe04mcvetwdz4a69d-1lmkql14semyzuuztao5n8sgemvy_vqyafbaran2m8o3zc.jpg',
  'https://lotofsense.com/ru/wp-content/uploads/2023/06/aaaabe1qvcdxknxg3hzpcuxwhmhhlr4ie9ya9zccfe04mcvetwdz4a69d-1lmkql14semyzuuztao5n8sgemvy_vqyafbaran2m8o3zc.jpg',
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: imageURL.length,
              itemBuilder: (context, index, realindex) {
                final imageUrl = imageURL[index];
                return Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    SizedBox(
                      height: 488,
                      width: double.infinity,
                      child: Image.network(
                        imageUrl,
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
                          Image.asset('assets/movie_name.png'),
                          const SizedBox(height: 16),
                          const Text(
                            'Жители Хоукинса — дети, подростки  и взрослые — сталкиваются с влиянием чуждого и опасного параллельного измерения.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
              count: imageURL.length,
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 0, 24),
                child: ListViewItem(),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 24),
          ),
        )
      ],
    );
  }
}
