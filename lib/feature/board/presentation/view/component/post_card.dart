import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gap/gap.dart';

import 'dart:math' as math;

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
              _VoteRatio(
                post: post,
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

class _VoteRatio extends StatelessWidget {
  final Post post;
  const _VoteRatio({required this.post});

  @override
  Widget build(BuildContext context) {
    const Color end = Color(0xffD9D9D9);

    return Row(
      children: [
        Expanded(
          child: ClipPath(
            clipper: _LightningClipperLeft(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colors.primaryWhite,
                    context.colors.primaryGreen,
                  ],
                ),
              ),
              width: MediaQuery.sizeOf(context).width,
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    post.voteRatio.first.ceil().toString(),
                  ),
                  const Gap(20)
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: ClipPath(
              clipper: _LightningClipperRight(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colors.primaryWhite,
                      context.colors.primaryBlue,
                    ],
                  ),
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Text(
                        post.voteRatio.last.ceil().toString(),
                      ),
                    ),
                    const Gap(20)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LightningClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 10, size.height * 0.7);
    path.lineTo(size.width, size.height * 0.7);
    path.lineTo(size.width - 5, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _LightningClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 5, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width - 10, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
