import 'package:flutter/cupertino.dart';

import '../model/home_model.dart';

class MusicProvider with ChangeNotifier {

  bool isPlay = false;
  Duration totalDuration = const Duration(seconds: 0);
  int index = 0;

  List<HomeModel> musicList = [
    HomeModel(
        image: "assets/images/img1.jpg",
        music: "assets/music/music1.mp3",
        title: "Aejan Vally",
        subTitle: "Manan Bhardwaj , Bhupinder Babbal",
    ),
    HomeModel(
        image: "assets/images/img2.jpeg",
        music: "assets/music/music2.mp3",
        title: "Jamal Kudu",
        subTitle: "HarshVardhan Rameshwar , Choir",
    ),
    HomeModel(
        image: "assets/images/img3.jpg",
        music: "assets/music/music3.mp3",
        title: "Papa Meri Jaan",
        subTitle: "Sonu Nigam , HarshVardhan Rameshwar , Raj Shekhar",
    ),
    HomeModel(
        image: "assets/images/img4.jpg",
        music: "assets/music/music4.mp3",
        title: "Pehle Bhi Main",
        subTitle: "Vishal Mishra , Raj Shekhar",
    ),
  ];


  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changTotalDuration(Duration d1) {
    totalDuration = d1;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isPlay = status;
    notifyListeners();
  }
}
