import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';

import '../../../../../core/utils/data/models/category_model.dart';
import 'health_scan_categories_header_widget.dart';
import 'health_scan_item_widget.dart';

class HealthScanCategoriesWidget extends StatelessWidget {
   HealthScanCategoriesWidget({super.key});
   List<categoryModel> categories=[
     categoryModel(title:"Knee" , image: Assets.kneeIcon),
     categoryModel(title: "Lung", image: Assets.lungIcon)

   ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        HealthScanCategoriesHeaderWidget(),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(child: HealthScanItemWidget(model:categories[0])),
            Expanded(child: HealthScanItemWidget(model:categories[1])),
          ],
        ),
      ],
    );
  }
}
