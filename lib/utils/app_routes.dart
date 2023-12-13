import 'package:flutter/material.dart';
import 'package:music_player/screen/home/view/music_screen.dart';
import 'package:music_player/screen/music/view/music_player_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const HomeScreen(),
  'MusicPlayer': (context) => const MusicPlayerScreen(),
};
