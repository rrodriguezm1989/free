import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerWidget extends StatefulWidget {
  final double height;
  _AssetPlayerWidgetState? player;

  AssetPlayerWidget({Key? key, required this.height}) : super(key: key);

  @override
  State<AssetPlayerWidget> createState() {
    player = _AssetPlayerWidgetState();
    return player!;
  }

  void resume() {
    player?.restart();
  }

  void stop() {
    player?._controller.pause();
  }
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    print("object");
    _controller = VideoPlayerController.asset('assets/videos/qr_code.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
    print("deos");
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: _controller, height: widget.height);
  }

  void restart() {
    _controller.initialize();
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
    print("building item");
    if (controller.value.isInitialized) {
      print("building item");

      controller.setVolume(0);
      return Container(
          height: height, alignment: Alignment.topCenter, child: buildVideo());
    } else {
      print("building item ajdlkajskldj");

      return const SizedBox(
          height: 200, child: Center(child: CircularProgressIndicator()));
    }
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
