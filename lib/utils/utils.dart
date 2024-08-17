import 'package:music_player/models/song.dart';
import 'package:music_player/providers/music_provider.dart';

void pauseAndPlay(Song song, MusicProvider musicProvider) {
  song.isPlaying ? musicProvider.pauseSong() : musicProvider.playSong(song);
}

void justPlay(Song song, MusicProvider musicProvider) {
  musicProvider.playSong(song);
}


