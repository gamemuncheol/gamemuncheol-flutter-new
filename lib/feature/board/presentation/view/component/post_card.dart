import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/util/url_util.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/custom_amazon_player.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  VideoPlayerController? videoPlayerController;

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  Future<VideoPlayerController> setVideoController() async {
    if (videoPlayerController != null) {
      return videoPlayerController!;
    }

    if (UrlUtil.urlToYoutubeId(widget.post.videoUrl) == null) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(
          "https://www.tcpschool.com/lectures/sample_video_mp4.mp4",
        ),
      );

      return videoPlayerController!;
    } else {
      var manifest = await YoutubeExplode()
          .videos
          .streamsClient
          .getManifest(UrlUtil.urlToYoutubeId(widget.post.videoUrl));

      videoPlayerController = VideoPlayerController.networkUrl(
        manifest.muxed.withHighestBitrate().url,
      );

      return videoPlayerController!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Gap(15.w),
              _ProfileImage(
                feed: widget.post,
              ),
              Gap(15.w),
              Expanded(
                child: _PostHeader(
                  post: widget.post,
                ),
              ),
              Gap(15.w),
            ],
          ),
          Gap(10.h),
          FutureBuilder(
              future: setVideoController(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomAmazonPlayer(
                    videoPlayerController: snapshot.data!,
                    thumbnailUrl: widget.post.thumbnailUrl,
                  );
                }

                return Image.asset(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 9 / 16,
                  AppAsset.ZZOL_PLACEHOLDER,
                );
              }),
          _VoteRatio(
            post: widget.post,
          ),
          Gap(10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: _Content(
              post: widget.post,
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
      padding: EdgeInsets.all(
        2.5.w,
      ),
      height: 50.h,
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
        borderRadius: BorderRadius.circular(
          200,
        ),
        child: CachedNetworkImage(
          imageUrl: feed.member.picture,
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    final viewCountInfo = "조회수 ${post.viewCount.toString()}회";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.member.nickname,
              style: context.textStyles.body5M,
            ),
            Gap(10.h),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    style: context.textStyles.cap1,
                    children: [
                      TextSpan(
                        text: viewCountInfo,
                      ),
                      const TextSpan(
                        text: "  ·  ",
                      ),
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
                    context.colors.primaryGreen,
                  ],
                ),
              ),
              width: MediaQuery.sizeOf(context).width,
              height: 35.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${post.voteRatio.first.ceil()}%",
                    style: context.textStyles.body2M
                        .copyWith(color: context.colors.onPrimaryGreen),
                  ),
                  Gap(20.w)
                ],
              ),
            ),
          ),
        ),
        Image.asset(
          width: 20.w,
          AppAsset.VS_ICON,
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
                      context.colors.primaryBlue,
                    ],
                  ),
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 35.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Text(
                        "${post.voteRatio.last.ceil()}%",
                        style: context.textStyles.body2M
                            .copyWith(color: context.colors.onPrimaryBlue),
                      ),
                    ),
                    Gap(20.w)
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

class _Content extends StatelessWidget {
  final Post post;
  const _Content({required this.post});

  @override
  Widget build(BuildContext context) {
    return Text(
      post.content ??
          "dsadasasdadsasdsadsdasadadsdasdassdadsasdadsadasasdsdasaddsadsadasasdadsasdsadsdasadadsdasdassdadsasdadsadasasdsdasaddsadsadasasdadsasdsadsdasadadsdasdassdadsasdadsadasasdsdasaddsa",
      maxLines: 2,
    );
  }
}
