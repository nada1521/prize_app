import 'package:flutter/material.dart';

class IntroductionTextTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  const IntroductionTextTitle({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: 'SSTArabicMedium',
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class IntroductionMainImage extends StatelessWidget {
  final String svgImage;
  const IntroductionMainImage({
    super.key,
    required this.svgImage,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      svgImage,
      fit: BoxFit.scaleDown, // Ensures it fits within the aspect ratio
    );
  }
}

class IntroductionTextDescription extends StatelessWidget {
  final String text;
  final double fontSize;
  const IntroductionTextDescription({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: 'SSTArabicMedium',
      ),
      child: Text(
          // 'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit. Nisi nulla purus neque quisque\n dictum dui. Accumsan fames adipiscing.',
          text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center),
    );
  }
}
