import 'package:flutter/material.dart';
import 'package:tamenny_app/core/constants/app_constants.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/data/models/category_model.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class HealthScanCategoriesView extends StatelessWidget {
   HealthScanCategoriesView({super.key});

  List<categoryModel> categories=[
    categoryModel(title:"Knee" , image: Assets.kneeIcon),
    categoryModel(title: "Lung", image: Assets.lungIcon),
    categoryModel(title: "Heart", image: Assets.heartIcon),
    categoryModel(title: "Brain", image: Assets.brainIcon)



  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Health Scan Categories'),
      body:  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 32.0,
          crossAxisSpacing: 8.0,
        ),
        padding: const EdgeInsets.only(
          top: 42,
          left: 16,
          right: 16,
        ), // padding around the grid
        itemCount: categories.length, // total number of items
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap:(){
                  switch(index){
                    case(0):
                      Navigator.pushNamed(context, Routes.scanView,arguments:appConstants.knee);
                    case(1):
                      Navigator.pushNamed(context, Routes.scanView,arguments:appConstants.lung);
                    case(2):
                      Navigator.pushNamed(context, Routes.scanView,arguments:appConstants.heart);
                    case(3):
                      Navigator.pushNamed(context, Routes.scanView,arguments:appConstants.brain);


                  }


                      },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xffF4F8FF),
                  backgroundImage:AssetImage(categories[index].image)
                ),
              ),
              const SizedBox(
                height: 12,
              ),
               Text(
                categories[index].title,
                style: AppStyles.font12Regular,
              ),
            ],
          );
        },
      ),
    );
  }
}
