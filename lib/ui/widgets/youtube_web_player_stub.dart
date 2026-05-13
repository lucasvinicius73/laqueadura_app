import 'package:flutter/material.dart';

/// Stub para plataformas não-web. Nunca é chamado de fato
/// porque o youtube_player_widget.dart só usa essa classe quando kIsWeb == true,
/// mas precisa existir para compilação condicional.
class YoutubeWebPlayer extends StatelessWidget {
  final String videoId;
  const YoutubeWebPlayer({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
