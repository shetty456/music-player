import 'package:flutter/material.dart';

// Enum for size options
enum SizeOption {
  sm,
  md,
  lg,
}

class TitleArtist extends StatelessWidget {
  final String title;
  final String artist;
  final SizeOption sizeOption;
  final TextAlign textAlign;

  const TitleArtist({
    super.key,
    required this.title,
    required this.artist,
    this.sizeOption = SizeOption.md, // Default to medium size
    this.textAlign = TextAlign.start, // Default to center alignment
  });

  @override
  Widget build(BuildContext context) {
    // Define font sizes based on the size option
    double titleFontSize;
    double artistFontSize;

    switch (sizeOption) {
      case SizeOption.sm:
        titleFontSize = 16; // Small title font size
        artistFontSize = 12; // Small artist font size
        break;
      case SizeOption.md:
        titleFontSize = 20; // Medium title font size
        artistFontSize = 16; // Medium artist font size
        break;
      case SizeOption.lg:
        titleFontSize = 24; // Large title font size
        artistFontSize = 20; // Large artist font size
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title, // Title of the song
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign, // Apply text alignment
        ),
        Text(
          artist, // Subtitle (artist or album)
          style: TextStyle(
            fontSize: artistFontSize,
            color: Colors.grey[600],
          ),
          textAlign: textAlign, // Apply text alignment
        ),
      ],
    );
  }
}
