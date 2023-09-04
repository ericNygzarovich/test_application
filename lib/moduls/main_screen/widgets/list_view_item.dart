import 'package:flutter/material.dart';
import 'package:test_app/moduls/main_screen/widgets/custom_progress_liner_indicator.dart';

class ListViewItem extends StatelessWidget {
  final String currentTime;
  final String image;
  final String nameOfMovie;
  final String currentSeries;
  final String currenSeason;
  final double currentViewingPosition;

  const ListViewItem({
    super.key,
    required this.currentSeries,
    required this.currentViewingPosition,
    required this.image,
    required this.nameOfMovie,
    required this.currenSeason,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208,
      width: 226,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 156,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      height: 20,
                      width: 44,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(9, 9, 12, 0.6),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(255, 255, 255, 0.3),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          currentTime,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomPaint(
              painter: CustomProgressLinerIndicator(
                percentProgress: 0.5,
                width: 226,
              ),
            ),
          ),
          Text(
            nameOfMovie,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$currenSeason сезон $currentSeries серия',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
