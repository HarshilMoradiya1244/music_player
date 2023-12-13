import 'package:flutter/cupertino.dart';

import '../model/home_model.dart';

class MusicProvider with ChangeNotifier {
  List<HomeModel> musicList = [HomeModel(name: "", music: "", title: "")];
}
