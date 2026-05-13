import 'dart:ui_web' as ui_web;
import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class YoutubeWebPlayer extends StatefulWidget {
  final String videoId;
  const YoutubeWebPlayer({super.key, required this.videoId});

  @override
  State<YoutubeWebPlayer> createState() => _YoutubeWebPlayerState();
}

class _YoutubeWebPlayerState extends State<YoutubeWebPlayer> {
  late final String _viewId;

  @override
  void initState() {
    super.initState();
    _viewId = 'yt-${widget.videoId}-${DateTime.now().millisecondsSinceEpoch}';

    ui_web.platformViewRegistry.registerViewFactory(_viewId, (int id) {
      final iframe = web.HTMLIFrameElement()
        ..src =
            'https://www.youtube.com/embed/${widget.videoId}?rel=0&showinfo=0'
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow =
            'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share'
        ..allowFullscreen = true;
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: HtmlElementView(viewType: _viewId),
    );
  }
}
