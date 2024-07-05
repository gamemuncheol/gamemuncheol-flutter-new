import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/full_screen.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubPlayer extends StatefulWidget {
  final Post post;
  const CustomYoutubPlayer({super.key, required this.post});

  @override
  State<CustomYoutubPlayer> createState() => _CustomYoutubPlayerState();
}

class _CustomYoutubPlayerState extends State<CustomYoutubPlayer> {
  late final YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
      widget.post.videoUrl,
    )!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      forceHD: true,
    ),
  );

  bool isLandScapeMode = false;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      bottomActions: [
        CurrentPosition(
          controller: controller,
        ),
        Gap(5.w),
        Expanded(
          child: ProgressBar(
            colors: ProgressBarColors(
              backgroundColor: context.colors.primaryWhite,
              handleColor: context.colors.primaryGreen,
            ),
            controller: controller,
          ),
        ),
        RemainingDuration(
          controller: controller,
        ),
        IconButton(
          icon: Icon(
            Icons.fullscreen,
            color: context.colors.primaryWhite,
          ),
          onPressed: () {
            if (GoRouterState.of(context).matchedLocation == FullScreen.PATH) {
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
      progressColors: ProgressBarColors(
        handleColor: context.colors.primaryBlue,
      ),
      progressIndicatorColor: context.colors.primaryBlue,
      controller: controller,
    );
  }
}
