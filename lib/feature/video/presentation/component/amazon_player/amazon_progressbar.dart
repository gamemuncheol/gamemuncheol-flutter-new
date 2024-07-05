import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AmazonProgressBarColor {
  final Color? back;
  final Color? playedColor;
  final Color? bufferedColor;
  final Color? handle;

  const AmazonProgressBarColor({
    this.back,
    this.playedColor,
    this.bufferedColor,
    this.handle,
  });

  AmazonProgressBarColor copyWith({
    Color? back,
    Color? playedColor,
    Color? bufferedColor,
    Color? handle,
  }) =>
      AmazonProgressBarColor(
        back: back ?? this.back,
        handle: handle ?? this.handle,
        bufferedColor: bufferedColor ?? this.bufferedColor,
        playedColor: playedColor ?? this.playedColor,
      );
}

class AmazonProgressBar extends StatefulWidget {
  final VideoPlayerController controller;
  final AmazonProgressBarColor colors;

  const AmazonProgressBar({
    super.key,
    required this.controller,
    required this.colors,
  });

  @override
  ProgressBarState createState() {
    return ProgressBarState();
  }
}

class ProgressBarState extends State<AmazonProgressBar> {
  Offset _touchPoint = Offset.zero;

  double _playedValue = 0.0;
  double _bufferedValue = 0.0;

  bool _touchDown = false;
  late Duration _position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.controller.addListener(positionListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(positionListener);
    super.dispose();
  }

  void positionListener() {
    var totalDuration = widget.controller.value.duration.inMilliseconds;
    if (mounted && !totalDuration.isNaN && totalDuration != 0) {
      try {
        setState(() {
          _playedValue =
              widget.controller.value.position.inMilliseconds / totalDuration;
          _bufferedValue =
              widget.controller.value.buffered.last.end.inMilliseconds /
                  totalDuration;
        });
      } catch (e) {}
    }
  }

  void _setValue() {
    _playedValue = _touchPoint.dx / context.size!.width;
  }

  void _checkTouchPoint() {
    if (_touchPoint.dx <= 0) {
      _touchPoint = Offset(0, _touchPoint.dy);
    }
    if (_touchPoint.dx >= context.size!.width) {
      _touchPoint = Offset(context.size!.width, _touchPoint.dy);
    }
  }

  void _seekToRelativePosition(Offset globalPosition) {
    final box = context.findRenderObject() as RenderBox;
    _touchPoint = box.globalToLocal(globalPosition);
    _checkTouchPoint();
    final relative = _touchPoint.dx / box.size.width;
    _position = widget.controller.value.duration * relative;
    widget.controller.seekTo(_position);
  }

  void _dragEndActions() {
    setState(() {
      _touchDown = false;
    });
    widget.controller.play();
  }

  @override
  Widget build(BuildContext context) => _buildBar();

  Widget _buildBar() {
    return GestureDetector(
      onHorizontalDragDown: (details) {
        widget.controller.pause();
        _seekToRelativePosition(details.globalPosition);
        setState(() {
          _setValue();
          _touchDown = true;
        });
      },
      onHorizontalDragUpdate: (details) {
        _seekToRelativePosition(details.globalPosition);
        setState(_setValue);
      },
      onHorizontalDragEnd: (details) {
        _dragEndActions();
      },
      onHorizontalDragCancel: _dragEndActions,
      child: Container(
        color: Colors.transparent,
        constraints: const BoxConstraints.expand(height: 7.0 * 2),
        child: CustomPaint(
          painter: _ProgressBarPainter(
            progressWidth: 2.0,
            handleRadius: 7.0,
            playedValue: _playedValue,
            bufferedValue: _bufferedValue,
            colors: widget.colors,
            touchDown: _touchDown,
            themeData: Theme.of(context),
          ),
        ),
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double progressWidth;
  final double handleRadius;
  final double playedValue;
  final double bufferedValue;
  final AmazonProgressBarColor? colors;
  final bool touchDown;
  final ThemeData themeData;

  _ProgressBarPainter({
    required this.progressWidth,
    required this.handleRadius,
    required this.playedValue,
    required this.bufferedValue,
    this.colors,
    required this.touchDown,
    required this.themeData,
  });

  @override
  bool shouldRepaint(_ProgressBarPainter old) {
    return playedValue != old.playedValue ||
        bufferedValue != old.bufferedValue ||
        touchDown != old.touchDown;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.square
      ..strokeWidth = progressWidth;

    final centerY = size.height / 2.0;
    final barLength = size.width - handleRadius * 2.0;

    final startPoint = Offset(handleRadius, centerY);
    final endPoint = Offset(size.width - handleRadius, centerY);
    final progressPoint = Offset(
      barLength * playedValue + handleRadius,
      centerY,
    );
    final secondProgressPoint = Offset(
      barLength * bufferedValue + handleRadius,
      centerY,
    );

    final secondaryColor = themeData.colorScheme.secondary;

    paint.color = colors?.back ?? secondaryColor.withOpacity(0.38);
    canvas.drawLine(startPoint, endPoint, paint);

    paint.color = colors?.bufferedColor ?? Colors.white70;
    canvas.drawLine(startPoint, secondProgressPoint, paint);

    paint.color = colors?.playedColor ?? secondaryColor;
    canvas.drawLine(startPoint, progressPoint, paint);

    final handlePaint = Paint()..isAntiAlias = true;

    handlePaint.color = Colors.transparent;
    canvas.drawCircle(progressPoint, centerY, handlePaint);

    final handleColor = colors?.handle ?? secondaryColor;

    if (touchDown) {
      handlePaint.color = handleColor.withOpacity(0.4);
      canvas.drawCircle(progressPoint, handleRadius * 3, handlePaint);
    }

    handlePaint.color = handleColor;
    canvas.drawCircle(progressPoint, handleRadius, handlePaint);
  }
}
