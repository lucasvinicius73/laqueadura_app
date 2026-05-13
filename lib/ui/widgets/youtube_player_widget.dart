import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt_flutter;
import 'youtube_web_player.dart';

class YouTubePlayerWidget extends StatefulWidget {
  final String videoUrl;

  const YouTubePlayerWidget({
    super.key,
    required this.videoUrl,
  });

  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  yt_flutter.YoutubePlayerController? _flutterController;

  String? _extractVideoId(String url) {
    final regExp = RegExp(
        r'(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))([\w-]{11})');
    final match = regExp.firstMatch(url);
    return match?.group(1);
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      final videoId = _extractVideoId(widget.videoUrl) ?? '';
      _flutterController = yt_flutter.YoutubePlayerController(
        initialVideoId: videoId,
        flags: const yt_flutter.YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _flutterController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      final videoId = _extractVideoId(widget.videoUrl) ?? '';
      return YoutubeWebPlayer(videoId: videoId);
    }

    return yt_flutter.YoutubePlayer(
      controller: _flutterController!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      progressColors: const yt_flutter.ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
      ),
    );
  }
}
