import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app_sample/audio_player_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music App Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AudioServiceWidget(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            RaisedButton(
              child: Text("Start"),
              onPressed: () async {
                print('tap onPlay');
                await AudioService.start(
                    backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
              },
            ),
            RaisedButton(child: Text("Stop"), onPressed: stop),
          ],
        ),
      ),
    );
  }

  stop() => AudioService.stop();
}

// class内に配置せず、トップレベルの関数とする必要がある。
_backgroundTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
