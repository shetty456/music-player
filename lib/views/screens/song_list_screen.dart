// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:music_player/utils/utils.dart';
import 'package:music_player/views/widgets/album_image.dart';
import 'package:provider/provider.dart';
import 'package:music_player/providers/music_provider.dart';
import 'package:music_player/views/screens/individual_song_screen.dart';
import 'package:music_player/views/widgets/music_player.dart';
import 'package:lottie/lottie.dart';

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
      body: Column(
        children: [
          MusicPlayer(song: musicProvider.currentSong),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  musicProvider.currentSong != null
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: Text(
                            'Up Next',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : const Text(''),
                  Expanded(
                    child: ListView.separated(
                      itemCount: musicProvider.songs.length,
                      itemBuilder: (context, index) {
                        final song = musicProvider.songs[index];
                        return ListTile(
                          leading: AlbumImage(
                            song: song,
                            radius: 50,
                          ),
                          title: Text(song.title),
                          subtitle: Text(song.artist),
                          trailing: song.isPlaying ? Lottie.asset('assets/animations/playing.json') : null,
                          onLongPress: () {
                            justPlay(song, musicProvider);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IndividualSongScreen(
                                  song: song,
                                ),
                              ),
                            );
                          },
                          onTap: () {
                            pauseAndPlay(song, musicProvider);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey.shade300,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
