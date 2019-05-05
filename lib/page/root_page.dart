import 'package:flutter/material.dart';
import 'my_inheritedwidget.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:music_player_flutter/page/music_list_view.dart';
import 'package:music_player_flutter/page/now_playing.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootIW = MyInheritedWidget.of(context);
    //Goto Now Playing Page
    void goToNowPlaying(Song song, {bool nowPlayTap: false}) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new NowPlaying(
                rootIW.songData,
                song,
                nowPlayTap: nowPlayTap,
              )));
    }

    //Shuffle Songs and goto now playing page
    void shuffleSongs() {
      goToNowPlaying(rootIW.songData.randomSong);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Music Demo Player"),
        actions: <Widget>[
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Center(
              child: new InkWell(
                  child: new Text("Now Playing"),
                  onTap: () => goToNowPlaying(
                    rootIW.songData.songs[
                    (rootIW.songData.currentIndex == null ||
                        rootIW.songData.currentIndex < 0)
                        ? 0
                        : rootIW.songData.currentIndex],
                    nowPlayTap: true,
                  )),
            ),
          )
        ],
      ),
      // drawer: new MPDrawer(),
      body: rootIW.isLoading
          ? new Center(child: new CircularProgressIndicator())
          : new Scrollbar(child: new MusicListView()),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.shuffle), onPressed: () => shuffleSongs()),
    );
  }
}