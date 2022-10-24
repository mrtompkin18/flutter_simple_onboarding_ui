import 'package:flutter/material.dart';

class SlideIndicator extends StatefulWidget {
  final bool active;

  const SlideIndicator({Key? key, required this.active}) : super(key: key);

  @override
  State<SlideIndicator> createState() => _SlideIndicatorState();
}

class _SlideIndicatorState extends State<SlideIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: widget.active
            ? const Color.fromRGBO(249, 126, 76, 1)
            : Colors.black26.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: widget.active
                ? const Color.fromRGBO(249, 126, 76, 0.4)
                : Colors.transparent,
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}
