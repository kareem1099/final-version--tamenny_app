import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_styles.dart';
import '../utils/app_assets.dart';

AppBar customAppBar(BuildContext context,{required String title , List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          Assets.imagesPopIcon,
          width: 30,
          height: 30,
        ),
      ),
    ),
    title: Text(
      title,
      style: AppStyles.font18SemiBold,
    ),
    actions: actions,
  );
}
