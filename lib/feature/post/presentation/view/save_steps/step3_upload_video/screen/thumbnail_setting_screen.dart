import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' hide Thumbnail;

import 'package:gamemuncheol_upstream/common/component/icon_button_rounded.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/common/util/url_util.dart';
import 'package:gamemuncheol_upstream/core/resource/extra.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/thumbnail.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/component/thumbnail_change_screen_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/screen/post_form_screen.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/full_screen.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/video_permission_screen.dart';

class ThumbnailSettingScreen extends ConsumerStatefulWidget {
  final bool hasPermission;
  const ThumbnailSettingScreen({super.key, required this.hasPermission});

  static const NAME = "THUMBNAIL_SETTING_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  ConsumerState<ThumbnailSettingScreen> createState() =>
      _ThumbnailSettingScreenState();
}

class _ThumbnailSettingScreenState
    extends ConsumerState<ThumbnailSettingScreen> {
  late final VideoPlayerController videoPlayerController;
  late final hasPermission = ValueNotifier(widget.hasPermission);

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Future<VideoPlayerController> setVideoController() async {
    if (UrlUtil.urlToYoutubeId(
            ref.read(uploadVideoNotifierProvider).value.videoUrl) ==
        null) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse("https://www.tcpschool.com/lectures/sample_video_mp4.mp4"),
      );

      return videoPlayerController;
    } else {
      var manifest = await YoutubeExplode().videos.streamsClient.getManifest(
          UrlUtil.urlToYoutubeId(
              ref.read(uploadVideoNotifierProvider).value.videoUrl));

      videoPlayerController = VideoPlayerController.networkUrl(
        manifest.muxed.withHighestBitrate().url,
      );

      return videoPlayerController;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(uploadVideoNotifierProvider, (pre, next) {
      if (next.isError && next.error.message.isNotEmpty) {
        Fluttertoast.showToast(msg: next.error.message);
      }
    });

    return BottomButtonExpanded(
      appBar: ThumbnailChangeScreenAppBar(
        onLeadingTap: context.pop,
      ).toPrefferedSize(),
      expanded: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(80.h),
          FutureBuilder(
              future: setVideoController(),
              builder: (context, snapshot) {
                return Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(uploadVideoNotifierProvider).when(
                      value: (value) {
                        return Thumbnail.fromMemory(
                          value.thumbnail,
                          onPreviewTap: () {
                            if (snapshot.hasData) {
                              context.push(
                                FullScreen.PATH,
                                extra: Extra({
                                  "videoPlayerController": snapshot.data,
                                  "thumbnailUrl": null,
                                  "thumbnailByte": value.thumbnail,
                                }),
                              );
                            }
                          },
                        );
                      },
                      orElse: () {
                        return const SizedBox();
                      },
                    );
                  },
                );
              }),
          Gap(40.h),
          ValueListenableBuilder(
            valueListenable: hasPermission,
            builder: (context, value, child) {
              return IconButtonRounded(
                onTap: () async {
                  if (value) {
                    await ref
                        .read(uploadVideoNotifierProvider.notifier)
                        .changeThumbnail();
                  } else {
                    hasPermission.value = (await context
                        .pushNamed<bool>(VideoPermissionScreen.NAME))!;
                  }
                },
                selected: value,
                label: "썸네일 수정",
                iconPath: value ? AppAsset.GALLER_ON : AppAsset.GALLERY_OFF,
              );
            },
          ),
        ],
      ),
      bottomButton: PostSaveFormNextButton(
        onTap: () {
          context.pushNamed(PostFormScreen.NAME);
        },
      ),
    );
  }
}
