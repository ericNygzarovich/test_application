import 'package:flutter/material.dart';

class HomeNavigationData {
  final IconData icon;
  final String label;

  const HomeNavigationData({
    required this.icon,
    required this.label,
  });
}

class HomeNavigationScreen extends StatefulWidget {
  final List<Widget> screens;
  final List<HomeNavigationData> navigation;

  const HomeNavigationScreen({
    super.key,
    required this.screens,
    required this.navigation,
  }) : assert(screens.length == navigation.length);

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  late PageController _controller;
  int _currentPage = _startPage;

  static const int _startPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: _startPage,
    );
  }

  Future<void> _changedPage(int page) async {
    _onChangePage(page);
    await _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _onChangePage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: _onChangePage,
              children: widget.screens,
            ),
          ),
          Container(
            height: 90,
            padding: const EdgeInsets.only(top: 10, bottom: 24),
            color: const Color.fromRGBO(35, 35, 38, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int page = 0; page < widget.navigation.length; page++)
                  SizedBox(
                    width: 74,
                    height: 60,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        if (page == _currentPage)
                          Image.asset(
                            'assets/Active.png',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        InkWell(
                          onTap: () => _changedPage(page),
                          child: Column(
                            children: [
                              Icon(
                                widget.navigation[page].icon,
                                color: page == _currentPage
                                    ? Colors.white
                                    : const Color.fromRGBO(186, 186, 186, 1),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.navigation[page].label,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: page == _currentPage
                                      ? Colors.white
                                      : const Color.fromRGBO(186, 186, 186, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
