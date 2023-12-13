import 'package:flutter/material.dart';
import 'package:music_player/utils/color.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  @override
  Widget build(BuildContext context) {
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
          actions: const [Icon(Icons.more_vert,color: Colors.black,)],
        ),
        backgroundColor: black,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              "assets/images/img1.jpg",
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: MediaQuery.sizeOf(context).height * 0.35,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Arjan Valliy ( From ' ANIMAl ')",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Manan Bhardwaj , Bhupinder Babbal",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            Slider(
              value: 5,
              onChanged: (value) {},
              activeColor: Colors.white,
              min: 1,
              max: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("0:37",style: TextStyle(color: Colors.white),),
                  Text("4:07",style: TextStyle(color: Colors.white),),
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle,
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
                  Icon(Icons.speaker_group,color: Colors.white,),
                  Spacer(),
                  Icon(Icons.share_outlined,color: Colors.white,),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.menu_open,color: Colors.white,),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
