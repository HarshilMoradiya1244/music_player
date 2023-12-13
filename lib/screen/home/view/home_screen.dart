import 'package:flutter/material.dart';
import 'package:music_player/screen/home/provider/home_provider.dart';
import 'package:music_player/screen/home/view/music_screen.dart';
import 'package:music_player/utils/color.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: green,
            title: const Text("Music Player"),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              dividerColor:Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note_outlined),
                  text: "Music",
                ),
                Tab(
                  icon: Icon(Icons.video_collection_outlined),
                  text: "Video",
                ),
              ],
            ),
          ),
          backgroundColor: black,
          body: const TabBarView(
            children: [
              MusicScreen(),
              MusicScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
