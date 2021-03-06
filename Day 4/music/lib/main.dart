import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoading;   //loader
  List<dynamic> _songs;
  MusicFinder audioPlayer;
  @override
  void initState() {

    super.initState();
    isLoading = true; //loader
    initPlayer();
  }

  void initPlayer() async{
    audioPlayer = new MusicFinder();
    var songs = await MusicFinder.allSongs();   //this "songs" is iterable
    songs = new List.from(songs);           //converting songs into "list"
    setState(() {
      isLoading = false;
      _songs=songs;
    });

  }

  Future _playLocal(String url) async{
    final result = await audioPlayer.play(url, isLocal: true);

  }


  ListView SongList(){

    return new ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, int index){
          return ListTile(
            leading: new CircleAvatar(
              child: new Text(_songs[index].title[0]),  //taking the first letter of the title
            ),
            title: new Text(_songs[index].title),
            onTap: ()=>_playLocal(_songs[index].uri),
          );

        }
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget Home(){
      return new Scaffold(
        appBar: new AppBar(title: new Text('Music Player'),
        ),

        body: isLoading ? new Center(   //checking if isLoading is true then we show a Progress Indicator
          child: new CircularProgressIndicator(),
        ) : SongList()
      );

    }
    return new MaterialApp(
    home: Home(),
    );
    
  }




}
