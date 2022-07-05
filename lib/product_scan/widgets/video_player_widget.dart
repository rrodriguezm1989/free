import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerWidget extends StatefulWidget {
  final double height;

  const AssetPlayerWidget({Key? key, required this.height}) : super(key: key);

  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/qr_code.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: _controller, height: widget.height);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final double height;

  const VideoPlayerWidget(
      {Key? key, required this.controller, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      controller.setVolume(0);
      return Container(
          height: height,
          alignment: Alignment.topCenter,
          child: buildVideo());
    } else {
      return const SizedBox(
          height: 200, child: Center(child: CircularProgressIndicator()));
    }
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
