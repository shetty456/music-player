// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:music_player/models/song.dart';

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    super.key,
    required this.song,
    required this.radius,
    required this.tag,
  });

  final Song song;
  final double radius;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: ClipOval(
        child: Image.asset(
          song.albumImageUrl,
          width: radius,
          height: radius,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
