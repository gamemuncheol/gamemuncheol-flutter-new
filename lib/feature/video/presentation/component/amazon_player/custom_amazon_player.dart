import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/core/resource/extra.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/thumbnail.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/amazon_current_duration.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/amazon_progressbar.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/amazon_remaining_duration.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/full_screen.dart';

class CustomAmazonPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String? thumbnailUrl;
  final Uint8List? thumbnailByte;

  const CustomAmazonPlayer({
    super.key,
    required this.videoPlayerController,
    this.thumbnailUrl,
    this.thumbnailByte,
  });

  @override
  State<CustomAmazonPlayer> createState() => _CustomAmazonPlayerState();
}

class _CustomAmazonPlayerState extends State<CustomAmazonPlayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController aniController;

  bool hideThumbnail = false;
  bool hideProgress = true;
  bool hidePlayButton = false;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    )..addListener(playButtonVisibilityListener);

    if (widget.videoPlayerController.value.isInitialized) {
      widget.videoPlayerController.addListener(playPauseListener);
      return;
    }

    widget.videoPlayerController
      ..addListener(playPauseListener)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    widget.videoPlayerController.removeListener(playPauseListener);
    aniController.removeListener(playButtonVisibilityListener);
    aniController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  void playPauseListener() {
    widget.videoPlayerController.value.isPlaying
        ? aniController.forward()
        : aniController.reverse();
  }

  void playButtonVisibilityListener() {
    if (aniController.isCompleted && hideProgress && context.mounted) {
      setState(() {
        hidePlayButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandScapeMode =
        MediaQuery.of(context).orientation != Orientation.portrait;

    return GestureDetector(
      onTap: () {
        if (context.mounted) {
          setState(() {
            hideProgress = !hideProgress;
            if (hideProgress == false) {
              hidePlayButton = false;
            }
          });
        }
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).width * 9 / 16,
        child: Stack(
          children: [
            VideoPlayer(
              widget.videoPlayerController,
            ),
            Visibility(
              visible: !hideThumbnail,
              child: Thumbnail(
                thumbnailUrl: widget.thumbnailUrl,
                thumbnailByte: widget.thumbnailByte,
              ),
            ),
            AnimatedOpacity(
              opacity: hideProgress ? 0 : 0.7,
              duration: const Duration(
                milliseconds: 300,
              ),
              child: Container(
                color: context.colors.black,
              ),
            ),
            Visibility(
              visible: !hidePlayButton,
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  color: context.colors.transParent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    onTap: () {
                      if (widget.videoPlayerController.value.isInitialized) {
                        if (!hideThumbnail) {
                          setState(() {
                            hideThumbnail = true;
                          });
                        }

                        widget.videoPlayerController.value.isPlaying
                            ? widget.videoPlayerController.pause()
                            : widget.videoPlayerController.play();
                      }
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: aniController.view,
                      color: context.colors.primaryWhite,
                      size: isLandScapeMode ? 30.w : 60.w,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  bottom: 5,
                ),
                child: IgnorePointer(
                  ignoring: hideProgress,
                  child: AnimatedOpacity(
                    opacity: hideProgress ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: Row(
                      children: [
                        AmazonCurrentDuration(
                          controller: widget.videoPlayerController,
                        ),
                        Gap(5.w),
                        Expanded(
                          child: AmazonProgressBar(
                            controller: widget.videoPlayerController,
                            colors: AmazonProgressBarColor(
                              handle: context.colors.primaryGreen,
                            ),
                          ),
                        ),
                        AmazonRemainingDuration(
                          controller: widget.videoPlayerController,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.fullscreen,
                            color: context.colors.primaryWhite,
                          ),
                          onPressed: () async {
                            if (GoRouterState.of(context).matchedLocation ==
                                FullScreen.PATH) {
                              if (isLandScapeMode) {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                              } else {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.landscapeRight,
                                  DeviceOrientation.landscapeLeft,
                                ]);
                              }

                              return;
                            }

                            await widget.videoPlayerController
                                .pause()
                                .whenComplete(
                                  () => context.push(
                                    FullScreen.PATH,
                                    extra: Extra({
                                      "videoPlayerController":
                                          widget.videoPlayerController,
                                      "thumbnailUrl": widget.thumbnailUrl,
                                      "thumbnailByte": widget.thumbnailByte,
                                    }),
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
