import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieWatchingScreen extends StatefulWidget {
  const MovieWatchingScreen({super.key});

  @override
  State<MovieWatchingScreen> createState() => _MovieWatchingScreenState();
}

class _MovieWatchingScreenState extends State<MovieWatchingScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    )..initialize().then((_) {
        setState(() {
          isLoading = false;
        }); // Update the state when video initialization is complete
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      // You can customize the controls here
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayerController.value.isInitialized) {
      return Scaffold(
        body: Center(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
