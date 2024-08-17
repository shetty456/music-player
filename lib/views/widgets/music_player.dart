// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/views/widgets/controls_button.dart';
import 'package:provider/provider.dart';

import 'package:music_player/models/song.dart';
import 'package:music_player/providers/music_provider.dart';
import 'package:music_player/utils/utils.dart';
import 'package:music_player/views/widgets/album_image.dart';
import 'package:music_player/views/widgets/title_artist.dart';

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
            radius: 120, tag: 'no-tag',
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
                  ControlButtons(song: song, musicProvider: musicProvider)
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
                radius: 240, tag: song.id,
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
                  StreamBuilder<DurationState>(
                    stream: musicProvider.durationState,
                    builder: (context, snapshot) {
                      final durationState = snapshot.data;
                      final progress = durationState?.progress ?? Duration.zero;
                      final buffered = durationState?.buffered ?? Duration.zero;
                      final total = durationState?.total ?? Duration.zero;
                      return ProgressBar(
                        progress: progress,
                        buffered: buffered,
                        total: total,
                        onSeek: (duration) {
                          musicProvider.player.seek(duration);
                        },
                      );
                    },
                  ),
                  ControlButtons(song: song, musicProvider: musicProvider),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    required this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
