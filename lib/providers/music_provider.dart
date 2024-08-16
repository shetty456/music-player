import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/models/song.dart';

class MusicProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<Song> _songs = [];
  Song? _currentSong;
  int _currentIndex = 0;

  MusicProvider() {
    _initializeSongs(); // Initialize the songs when the provider is created
  }

  List<Song> get songs => _songs;
  Song? get currentSong => _currentSong;

  void _initializeSongs() {
    _songs = [
      Song(
        id: '1',
        title: 'Endendu Ninnanu',
        artist: 'Dr. Rajkumar',
        albumImageUrl: 'assets/images/eradu.jpeg',
        audioUrl: 'assets/audio/endendu.mp3',
      ),
      Song(
        id: '2',
        title: 'Bhairavi Raga',
        artist: 'Bhairavi',
        albumImageUrl: 'assets/images/bhairavi.jpeg',
        audioUrl: 'assets/audio/bhairavi.mp3',
      ),
      Song(
        id: '3',
        title: 'Devon Ke Dev',
        artist: 'Mahadev',
        albumImageUrl: 'assets/images/dkd.jpeg',
        audioUrl: 'assets/audio/dkd.mp3',
      ),
      Song(
        id: '4',
        title: 'The Flutist',
        artist: 'Krsna',
        albumImageUrl: 'assets/images/krishna.jpeg',
        audioUrl: 'assets/audio/flute.mp3',
      ),
      Song(
        id: '5',
        title: 'Krishna Vaani',
        artist: 'Sri Krishna',
        albumImageUrl: 'assets/images/krsna.webp',
        audioUrl: 'assets/audio/krsna.mp3',
      ),
    ];
    notifyListeners();
  }

  Future<void> playSong(Song song) async {
    _currentIndex = _songs.indexOf(song);
    _updateCurrentSong(song);

    try {
      await _audioPlayer.setAsset(song.audioUrl);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing song: $e");
    }

    notifyListeners();
  }

  void pauseSong() {
    _audioPlayer.pause();
    _currentSong?.isPlaying = false;
    notifyListeners();
  }

  void resumeSong() {
    _audioPlayer.play();
    _currentSong?.isPlaying = true;
    notifyListeners();
  }

  void stopSong() {
    _audioPlayer.stop();
    _currentSong?.isPlaying = false;
    notifyListeners();
  }

  void playPreviousSong() {
    if (_currentIndex > 0) {
      _currentIndex--;
      playSong(_songs[_currentIndex]);
    }
  }

  void playNextSong() {
    if (_currentIndex < _songs.length - 1) {
      _currentIndex++;
      playSong(_songs[_currentIndex]);
    }
  }

  void _updateCurrentSong(Song song) {
    _currentSong?.isPlaying = false; // Reset the previous song's state
    _currentSong = song;
    _currentSong?.isPlaying = true;
  }
}
