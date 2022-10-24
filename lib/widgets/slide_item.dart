import 'package:flutter/material.dart';
import 'package:splash_screen_ui/models/slide_model.dart';

class SlideItem extends StatelessWidget {
  final Slide slide;

  const SlideItem({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            child: Image(
              image: AssetImage(slide.imageUrl),
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            slide.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            child: Text(
              slide.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
