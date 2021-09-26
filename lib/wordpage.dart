import 'dart:convert';
// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'package:wave/config.dart';
import 'package:wave/wave.dart';
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
  const WordPage({Key? key, required int index}) : super(key: key);
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
              child: Stack(
                children: [
                  Positioned(child: Container(
                    color: const Color(0xfffaae25),
                  )),
                  Positioned(child: WaveWidget(
                  config: CustomConfig(
                      gradients: [
                          [Colors.orange, const Color(0xEEF44336)],
                          [Colors.red[800]!, const Color(0x77E57373)],
                          [Colors.orange, const Color(0x66FF9800)],
                          [Colors.yellow[800]!, const Color(0x55FFEB3B)]
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: [0.20, 0.23, 0.25, 0.30],
                      blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      double.infinity
                  ),
              )),
                  Positioned(child: 
                  SwipableStack(
                controller: _controller,
                itemCount: getcount(),
                stackClipBehaviour: Clip.none,
                onSwipeCompleted: (index, direction) {
                  print("index ${index}");
                  if (_items.length == index+1) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, index, constraints) {
                  if(_items.isEmpty){
                    return Container();
                  }
                  var img = Image.asset(
                      _items[index]["image"],
                      fit: BoxFit.cover,
                      height: 300, // set your height
                      width: 300, // and width here
                    );

                    var image = SizedBox(child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child: img,
                    ));
                    
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
                                Text(_items[index]["kr"], style: const TextStyle(fontSize: 20)),
                                Text(_items[index]["ch"], style: const TextStyle(fontSize: 20)),
                                Text(_items[index]["speak"], style: const TextStyle(fontSize: 20)),
                                GestureDetector(
                                  onTap: () async =>{
                                      AssetsAudioPlayer.newPlayer().open(
                                          Audio(url)
                                      ),
                                  },
                                  child: const Icon(
                                    Icons.play_circle_outlined,
                                    color: Colors.blue,
                                    size: 90.0,
                                  ),
                                ),
                              ],
                            ),
                            ),
                            decoration: 
                            const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              )
              )
          ],
        ),
      ),])
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listenController);
    _controller.dispose();
  }

}