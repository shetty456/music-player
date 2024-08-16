import 'package:flutter/material.dart';

class IndividualSongScreen extends StatefulWidget {
  const IndividualSongScreen({super.key});

  @override
  State<IndividualSongScreen> createState() => _IndividualSongScreenState();
}

class _IndividualSongScreenState extends State<IndividualSongScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Here we will show the individual song',
        ),
      ),
    );
  }
}
