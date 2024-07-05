import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/amazon_current_duration.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/amazon_progressbar.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/amazon_remaining_duration.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/full_screen.dart';

class CustomAmazonPlayer extends StatefulWidget {
  final Post post;
  const CustomAmazonPlayer({super.key, required this.post});

  @override
  State<CustomAmazonPlayer> createState() => _CustomAmazonPlayerState();
}

class _CustomAmazonPlayerState extends State<CustomAmazonPlayer>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController videoPlayerController;
  late final AnimationController aniController;

  bool hideComponent = false;
  bool isLandScapeMode = false;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://www.tcpschool.com/lectures/sample_video_mp4.mp4",
      ),
    )
      ..addListener(playPauseListener)
      ..initialize().then((_) {
        if (context.mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    videoPlayerController.removeListener(playPauseListener);
    videoPlayerController.dispose();
    aniController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  void playPauseListener() {
    videoPlayerController.value.isPlaying
        ? aniController.forward()
        : aniController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.mounted) {
          setState(() {
            hideComponent = !hideComponent;
          });
        }
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).width * 9 / 16,
        child: Stack(
          children: [
            VideoPlayer(
              videoPlayerController,
            ),
            AnimatedOpacity(
              opacity: hideComponent ? 0.7 : 0,
              duration: const Duration(
                milliseconds: 300,
              ),
              child: Container(
                color: context.colors.black,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                color: context.colors.transParent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  onTap: () {
                    videoPlayerController.value.isPlaying
                        ? videoPlayerController.pause()
                        : videoPlayerController.play();
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: aniController.view,
                    color: context.colors.primaryWhite,
                    size: 60,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !hideComponent,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      AmazonCurrentDuration(
                        controller: videoPlayerController,
                      ),
                      Gap(5.w),
                      Expanded(
                        child: AmazonProgressBar(
                          controller: videoPlayerController,
                          colors: AmazonProgressBarColor(
                            back: context.colors.primaryWhite,
                            handle: context.colors.primaryGreen,
                          ),
                        ),
                      ),
                      AmazonRemainingDuration(
                        controller: videoPlayerController,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.fullscreen,
                          color: context.colors.primaryWhite,
                        ),
                        onPressed: () {
                 
                          if (GoRouterState.of(context).matchedLocation ==
                              FullScreen.PATH) {
                            if (isLandScapeMode) {
                              isLandScapeMode = false;
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                            } else {
                              isLandScapeMode = true;
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeRight,
                                DeviceOrientation.landscapeLeft,
                              ]);
                            }

                            return;
                          }

                          context.push(
                            FullScreen.PATH,
                            extra: widget.post,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
