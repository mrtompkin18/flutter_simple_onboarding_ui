import 'package:flutter/material.dart';
import 'package:splash_screen_ui/models/slide_model.dart';
import 'package:splash_screen_ui/widgets/slide_indicator.dart';

class SlideBottom extends StatefulWidget {
  final VoidCallback onClickNext;
  final int currentPage;

  const SlideBottom(
      {Key? key, required this.onClickNext, required this.currentPage})
      : super(key: key);

  @override
  State<SlideBottom> createState() => _SlideBottomState();
}

class _SlideBottomState extends State<SlideBottom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: List.generate(
                  sliders.length,
                  (index) =>
                      SlideIndicator(active: widget.currentPage == index),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => const Color.fromRGBO(249, 126, 76, 1),
                ),
              ),
              onPressed: widget.onClickNext,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "ถัดไป",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
