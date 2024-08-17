// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:music_player/views/widgets/title_artist.dart';
import 'package:provider/provider.dart';

import 'package:music_player/models/song.dart';
import 'package:music_player/providers/music_provider.dart';
import 'package:music_player/utils/utils.dart';
import 'package:music_player/views/widgets/album_image.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayer extends StatefulWidget {
  final Song? song;
  final bool? fullscreen;

  const MusicPlayer({
    super.key,
    this.song,
    this.fullscreen,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    switch (widget.fullscreen) {
      case true:
        return FullScreenPlayer(
          song: widget.song!,
          musicProvider: musicProvider,
        );
      default:
        return widget.song != null
            ? MiniScreenPlayer(
                song: widget.song!,
                musicProvider: musicProvider,
              )
            : Container();
    }
  }
}

class MiniScreenPlayer extends StatelessWidget {
  final Song song;
  final MusicProvider musicProvider;

  const MiniScreenPlayer({
    super.key,
    required this.song,
    required this.musicProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          AlbumImage(
            song: song,
            radius: 120,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleArtist(
                    title: song.title,
                    artist: song.artist,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        iconSize: 36,
                        onPressed: () {
                          // Handle skip to previous song
                        },
                      ),
                      IconButton(
                        icon: Icon(
                            song.isPlaying ? Icons.pause : Icons.play_arrow),
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
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FullScreenPlayer extends StatelessWidget {
  final Song song;
  final MusicProvider musicProvider;

  const FullScreenPlayer({
    super.key,
    required this.song,
    required this.musicProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: AlbumImage(
                song: song,
                radius: 240,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleArtist(
                    title: song.title,
                    artist: song.artist,
                    sizeOption: SizeOption.lg,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        iconSize: 36,
                        onPressed: () {
                          // Handle skip to previous song
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
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
