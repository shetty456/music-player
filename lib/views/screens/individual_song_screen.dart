// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:music_player/providers/music_provider.dart';
import 'package:music_player/views/widgets/music_player.dart';
import 'package:provider/provider.dart';

class IndividualSongScreen extends StatefulWidget {
  const IndividualSongScreen({
    super.key,
  });

  @override
  State<IndividualSongScreen> createState() => _IndividualSongScreenState();
}

class _IndividualSongScreenState extends State<IndividualSongScreen> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Planet'),
      ),
      body: MusicPlayer(
        song: musicProvider.currentSong,
        fullscreen: true,
      ),
    );
  }
}
