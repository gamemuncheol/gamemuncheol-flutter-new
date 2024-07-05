import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/feature/board/presentation/view/component/post_card.dart';

import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/board/presentation/provider/board_provider.dart';
import 'package:gamemuncheol_upstream/common/component/pagination_list_view.dart';

class HomeBoardScreen extends StatelessWidget {
  const HomeBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListview<Post>(
      provider: homeBoardNotifierProvider,
      paginationWidgetBuilder: <Post>(index, post) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
          ),
          child: PostCard(
            post: post,
          ),
        );
      },
    );
  }
}
