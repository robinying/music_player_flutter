import 'package:flutter/material.dart';
import 'package:music_player_flutter/data/song_data.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:music_player_flutter/page/my_inheritedwidget.dart';
import 'package:music_player_flutter/page/root_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  SongData songData;
  bool isLoading = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    isLoading = true;

    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print("Failed to get songs: '${e.message}'.");
    }

    print(songs);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      songData = new SongData((songs));
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose(){
    super.dispose();
    songData.audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(songData, isLoading, new RootPage());
  }
}
