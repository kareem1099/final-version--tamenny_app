import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/data/models/models_arguments.dart';
import 'package:tamenny_app/core/utils/data/models/post_model.dart';

import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post.dart';



class CommunityView extends StatelessWidget {
   CommunityView({super.key});
   List<postModel> posts=[
     postModel(name: "Kareem Yasser", username: "kareem"),
     postModel(name: "Youssef Ashraf", username: "youssef"),
     postModel(name: "Muaz Osama", username: "muaz"),
     postModel(name: "Mohamed Tharwat", username: "tharwat"),
     postModel(name: "Abdrlrahman Youssef", username: "abdo"),
     postModel(name: "Yousef Sabra", username: "sabra"),


   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Community',leadingIcon: false),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: 6,
            itemBuilder: (context, index) => Post(name: posts[index].name,username:posts[index].username)),
      ),
    );
  }
}

