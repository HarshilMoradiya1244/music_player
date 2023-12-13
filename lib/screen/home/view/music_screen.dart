import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset("assets/images/img1.jpg"),
        ),
        title: const Text("Music",style: TextStyle(color: Colors.white),),
        trailing: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "MusicPlayer");
          },
          icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,),

        ),
      ),
    );
  }
}
