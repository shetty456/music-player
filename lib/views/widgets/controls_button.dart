import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/providers/music_provider.dart';
import 'package:music_player/utils/utils.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({
    super.key,
    required this.song,
    required this.musicProvider,
  });

  final Song song;
  final MusicProvider musicProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous),
          iconSize: 36,
          onPressed: () {
            // Handle skip to previous song
            musicProvider.playPreviousSong();
          },
        ),
        IconButton(
          icon: Icon(
            song.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          iconSize: 36,
          onPressed: () {
            pauseAndPlay(
              song,
              musicProvider,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          iconSize: 36,
          onPressed: () {
            // Handle skip to next song
            musicProvider.playNextSong();
          },
        ),
      ],
    );
  }
}
