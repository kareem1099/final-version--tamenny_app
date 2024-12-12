import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';

class PostAction extends StatelessWidget {
  const PostAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(Assets.imagesLoveInactiveIcon)),
        const SizedBox(
          width: 5,
        ),
        const Text('50')
      ],
    );
  }
}
