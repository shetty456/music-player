import 'package:flutter/material.dart';
import 'package:music_player/providers/music_provider.dart';
import 'package:provider/provider.dart';

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Song List'),
      ),
      body: ListView.builder(
        itemCount: musicProvider.songs.length,
        itemBuilder: (context, index) {
          final song = musicProvider.songs[index];
          return ListTile(
            leading: ClipOval(
              child: Image.asset(
                song.albumImageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(song.title),
            subtitle: Text(song.artist),
            trailing: Icon(song.isPlaying ? Icons.pause : Icons.play_arrow),
            onTap: () {
              musicProvider.playSong(song);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => IndividualSongScreen(song: song),
              //   ),
              // );

              // todo: style list tile properly and make it a widget if needed.
              // todo: add the functionality for pausing the song
              // todo: make sure that the song state is carried to next screen as such without any furhter chnage.
            },
          );
        },
      ),
    );
  }
}
