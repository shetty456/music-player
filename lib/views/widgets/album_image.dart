import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    super.key,
    required this.song,
    required this.radius,
  });

  final Song song;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        song.albumImageUrl,
        width: radius,
        height: radius,
        fit: BoxFit.cover,
      ),
    );
  }
}