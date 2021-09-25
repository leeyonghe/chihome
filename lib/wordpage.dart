import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'package:assets_audio_player/assets_audio_player.dart';

class SwipeDirectionColor {
  static const right = Color.fromRGBO(70, 195, 120, 1);
  static const left = Color.fromRGBO(220, 90, 108, 1);
  static const up = Color.fromRGBO(83, 170, 232, 1);
  static const down = Color.fromRGBO(154, 85, 215, 1);
}

extension SwipeDirecionX on SwipeDirection {
  Object get color {
    switch (this) {
      case SwipeDirection.right:
        return const Color.fromRGBO(70, 195, 120, 1);
      case SwipeDirection.left:
        return const Color.fromRGBO(220, 90, 108, 1);
      case SwipeDirection.up:
        return const Color.fromRGBO(83, 170, 232, 1);
      case SwipeDirection.down:
        return const Color.fromRGBO(154, 85, 215, 1);
    }
  }
}


class WordPage extends StatefulWidget {
  const WordPage({Key? key}) : super(key: key);
  @override
  State<WordPage> createState(){
    return _WordPageState();
  }
}

class _WordPageState extends State<WordPage> {
  
  late SwipableStackController _controller;
  static const EdgeInsets _padding = EdgeInsets.all(16);
  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    
    _controller = SwipableStackController()..addListener(_listenController);
    
    
    
    readJson();

  }

  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/hsk1/hsk1.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  int getcount(){
    if(_items.isEmpty){
        return 0;
    }else{
        return _items.length;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text("HSK 1급"),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SwipableStack(
                controller: _controller,
                itemCount: getcount(),
                stackClipBehaviour: Clip.none,
                onSwipeCompleted: (index, direction) {

                },
                builder: (context, index, constraints) {
                  if(_items.isEmpty){
                    return Container();
                  }
                  var image = Image.asset(
                      _items[index]["image"],
                      fit: BoxFit.cover,
                      height: 300, // set your height
                      width: 300, // and width here
                    );
                    var url = _items[index]["sound"];
                  return Padding(
                    padding: _padding,
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            height: constraints.maxHeight,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                image,
                                const SizedBox(width: 300, height: 30,),
                                Text(_items[index]["kr"]),
                                Text(_items[index]["ch"]),
                                Text(_items[index]["speak"]),
                                GestureDetector(
                                  onTap: () async =>{
                                      AssetsAudioPlayer.newPlayer().open(
                                          Audio(url)
                                      ),
                                  },
                                  child: const Icon(
                                    Icons.play_circle_outlined,
                                    color: Colors.blue,
                                    size: 70.0,
                                  ),
                                ),
                              ],
                            ),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listenController);
    _controller.dispose();
  }

}