class Song {
  final String id;
  final String title;
  final String artist;
  final String albumImageUrl;
  final String audioUrl;
  bool isPlaying;
  bool isPaused;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumImageUrl,
    required this.audioUrl,
    this.isPlaying = false,
    this.isPaused = false,
  });
}
