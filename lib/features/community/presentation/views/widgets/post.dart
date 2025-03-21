import 'package:flutter/material.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_actions.dart';

import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class Post extends StatelessWidget {
  String? name;
  String? username;
  Post({super.key, required this.name,required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            Assets.imagesProfiel,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Text(
                    name!,
                    style: AppStyles.font13Bold,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '@${username}',
                          style: AppStyles.font10Bold
                              .copyWith(color: Colors.black.withOpacity(0.5)),
                        ),
                        Text(
                          '2 Hours',
                          style: AppStyles.font10Bold
                              .copyWith(color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'Ran a Heart Health Scan on Tamenny 💓 Results: ‘Normal Range’ but a lil reminder to stay active and eat clean 🥗. Feeling good, but anyone got easy workout tips? Let’s swap ideas! 🙌 #Tamenny #HealthCheck',
                style: AppStyles.font12Regular,
              ),
              SizedBox(
                height: 150,
                width: 200,
                child: Image.asset(
                  Assets.imagesPostImage,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const PostActions(),
            ],
          ),
        ),
      ],
    );
  }
}
