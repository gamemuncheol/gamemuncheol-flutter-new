import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/util/url_util.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/custom_amazon_player.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/custom_youtube_player.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 75,
                  right: 15,
                ),
                child: _PostHeader(
                  feed: post,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: UrlUtil.urlToYoutubeId(
                          post.videoUrl,
                        ) ==
                        null
                    ? CustomAmazonPlayer(
                        post: post,
                      )
                    : CustomYoutubPlayer(
                        post: post,
                      ),
              ),
            ],
          ),
          Positioned(
            left: 15,
            width: 50,
            child: _ProfileImage(
              feed: post,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  final Post feed;
  const _ProfileImage({required this.feed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            context.colors.primaryBlue,
            context.colors.primaryGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: CachedNetworkImage(
          imageUrl: feed.member.picture,
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post feed;
  const _PostHeader({required this.feed});

  @override
  Widget build(BuildContext context) {
    // final viewCountInfo = "조회수 ${feed.viewCount.toString()}회";
    // final String createdAt = TimeFormatter.calDiffer(feed.createdAt);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feed.member.nickname,
              style: context.textStyles.body5M,
            ),
            Gap(10.h),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    style: context.textStyles.cap1,
                    children: [
                      // TextSpan(
                      //   text: viewCountInfo,
                      // ),
                      // const TextSpan(
                      //   text: "  ·  ",
                      // ),
                      // TextSpan(
                      //   text: createdAt,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.more_vert,
        ),
      ],
    );
  }
}
