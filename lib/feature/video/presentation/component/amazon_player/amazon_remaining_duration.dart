import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/common/util/time_formatter.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:video_player/video_player.dart';

class AmazonRemainingDuration extends StatefulWidget {
  final VideoPlayerController controller;

  const AmazonRemainingDuration({super.key, required this.controller});

  @override
  AmazonRemainingDurationState createState() => AmazonRemainingDurationState();
}

class AmazonRemainingDurationState extends State<AmazonRemainingDuration> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "- ${TimeFormatter.durationFormatter(
        (widget.controller.value.duration.inMilliseconds) -
            (widget.controller.value.position.inMilliseconds),
      )}",
      style: TextStyle(
        color: context.colors.primaryWhite,
        fontSize: 12.0,
      ),
    );
  }
}
