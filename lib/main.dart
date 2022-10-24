import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen_ui/widgets/slide_bottom_section.dart';
import 'package:splash_screen_ui/widgets/slide_item.dart';

import 'models/slide_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash Screen UI",
      theme: ThemeData(
        fontFamily: "Line",
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (_) {
      if (_currentPage < sliders.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _skipToPage(_currentPage);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _skipToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onPageChange(int index) {
    setState(() => _currentPage = index);
  }

  void _onNext() {
    if (_currentPage == sliders.length - 1) {
      _skipToPage(0);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChange,
              itemCount: sliders.length,
              itemBuilder: (context, index) {
                Slide slide = sliders[index];
                return SlideItem(slide: slide);
              },
            ),
          ),
          SlideBottom(
            currentPage: _currentPage,
            onClickNext: _onNext,
          )
        ],
      ),
    );
  }
}
