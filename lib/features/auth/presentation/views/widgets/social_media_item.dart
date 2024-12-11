import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem(
      {super.key, required this.onTap, required this.socialMediaImageSource});
  final VoidCallback onTap;
  final String socialMediaImageSource;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: SizedBox(
            height: 27,
            width: 27,
            child: SvgPicture.asset(
              socialMediaImageSource,
            ),
          ),
        ),
      ),
    );
  }
}
