import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomClipImage extends StatelessWidget {
  const CustomClipImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.88,
        child: SvgPicture.asset(image),
      ),
    );
  }
}
