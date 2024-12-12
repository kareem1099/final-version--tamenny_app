import 'package:flutter/material.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_action.dart';

class PostActions extends StatelessWidget {
  const PostActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: PostAction()),
        Expanded(child: PostAction()),
        Expanded(child: PostAction()),
        Expanded(child: PostAction()),
      ],
    );
  }
}
