import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/common/util/url_util.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/custom_amazon_player.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/custom_youtube_player.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';

class FullScreen extends StatelessWidget {
  final Post post;

  const FullScreen({
    super.key,
    required this.post,
  });

  static const String NAME = "FULL_SCREEN";
  static final String PATH = "/${NAME.toLowerCase()}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: context.colors.black,
      body: Center(
        child: UrlUtil.urlToYoutubeId(post.videoUrl) != null
            ? CustomYoutubPlayer(post: post)
            : CustomAmazonPlayer(post: post),
      ),
    );
  }
}
