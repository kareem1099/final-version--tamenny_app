import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/utils/data/models/category_model.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HealthScanItemWidget extends StatelessWidget {
  const HealthScanItemWidget({super.key, required this.model});
  final categoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(child:GestureDetector(
      onTap: () {
         switch (model.title) {
          case "Knee":
            log('Navigating to: ${Routes.scanView}');
            Navigator.of(context, rootNavigator: true)
                .pushNamed(Routes.scanView,arguments:model.title );            break;
          case "Lung":
            log('Navigating to: ${Routes.scanView}');
            Navigator.of(context, rootNavigator: true)
                .pushNamed(Routes.scanView,arguments:model.title );           break;
          default:
            print("Unknown category: ${model.title}"); // Debug print for unexpected values
            break;
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage:AssetImage(model.image) ,
            radius: 28,
            backgroundColor: const Color(0xffF4F8FF),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            model.title,
            style: AppStyles.font12Regular,
          ),
        ],
      ),
    ));
  }
}