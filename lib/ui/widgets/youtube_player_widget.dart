import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt_flutter;
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as yt_iframe;

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
  yt_iframe.YoutubePlayerController? _iframeController;

  @override
  void initState() {
    super.initState();

    final videoId = _extractVideoId(widget.videoUrl) ?? '';

    if (kIsWeb) {
      _iframeController = yt_iframe.YoutubePlayerController.fromVideoId(
        videoId: videoId,
        autoPlay: false,
        params: const yt_iframe.YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          mute: false,
          origin: 'https://www.youtube.com',
        ),
      );
    } else {
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

  String? _extractVideoId(String url) {
    final regExp = RegExp(
        r'(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))([\w-]{11})');
    final match = regExp.firstMatch(url);
    return match?.group(1);
  }

  @override
  void dispose() {
    _iframeController?.close();
    _flutterController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return yt_iframe.YoutubePlayer(
        controller: _iframeController!,
        aspectRatio: 16 / 9,
      );
    } else {
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
}
