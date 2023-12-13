import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/utils/color.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  MusicProvider? providerr;
  MusicProvider? providerw;

  @override
  void initState() {
    super.initState();
    player.open(
        Audio(
            "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().index].music}"),
        autoStart: false,
        showNotification: true);

    player.current.listen((event) {
      Duration d1 = event!.audio.duration;
      context.read<MusicProvider>().changTotalDuration(d1);
    });
  }

  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: green,
              title: const Column(
                children: [
                  Text(
                    "PLAYING FROM YOUR PLAYLIST",
                    style: TextStyle(fontSize: 11, letterSpacing: 2),
                  ),
                  Text(
                    "Liked Songs",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ],
              ),
              centerTitle: true,
              actions: const [
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )
              ],
            ),
            backgroundColor: black,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "${providerw!.musicList[providerw!.index].image}",
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      width: MediaQuery.sizeOf(context).height * 0.35,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${providerw!.musicList[providerw!.index].title}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     Text(
                      "${providerw!.musicList[providerw!.index].subTitle}",
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    PlayerBuilder.currentPosition(
                      player: player,
                      builder: (context, position) =>
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Slider(
                          min: 0,
                          max: providerr!.totalDuration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          activeColor: Colors.white,
                          onChanged: (value) {
                            player.seek(
                              Duration(
                                seconds: value.toInt(),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                "${position}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const Spacer(),
                              Text(
                                "${providerw!.totalDuration}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shuffle,
                                  color: Colors.white,
                                  size: 20,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                  size: 40,
                                )),
                            IconButton(
                                onPressed: () {
                                  if (providerr!.isPlay == false) {
                                    player.play();
                                    providerr!.changeStatus(true);
                                  } else {
                                    player.pause();
                                    providerr!.changeStatus(false);
                                  }
                                },
                                icon: Icon(
                                  providerw!.isPlay
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 60,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: 40,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.speaker_group,
                                color: Colors.white,
                              ),
                              Spacer(),
                              Icon(
                                Icons.share_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.menu_open,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]),
            )));
  }
}
