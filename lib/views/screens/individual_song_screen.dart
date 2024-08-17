// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:music_player/models/song.dart';
import 'package:music_player/views/widgets/music_player.dart';

class IndividualSongScreen extends StatefulWidget {
  final Song song;
  const IndividualSongScreen({
    super.key,
    required this.song,
  });

  @override
  State<IndividualSongScreen> createState() => _IndividualSongScreenState();
}

class _IndividualSongScreenState extends State<IndividualSongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Planet'),
      ),
      body: MusicPlayer(
        song: widget.song,
        fullscreen: true,
      ),
    );
  }
}
