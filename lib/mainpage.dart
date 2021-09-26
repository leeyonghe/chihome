import 'package:flutter/material.dart';
import 'wordpage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<MainPage> {

  late int idx = 0;
  
  Widget getBody(int index){
    switch (index) {
      case 0:
        return Container(
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: GridView.extent(  
            primary: false,  
            padding: const EdgeInsets.all(16),  
            crossAxisSpacing: 10,  
            mainAxisSpacing: 10,  
            maxCrossAxisExtent: 200.0,  
            children: <Widget>[  
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage(index: 1)),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                // padding: const EdgeInsets.all(8),  
                child: Stack(
                  children: [
                Positioned(child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: const Color(0xfffaae25)
                  )
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
                      // blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      100,
                  ),
              )),
              const Positioned(child: Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ))
                  ],
                ),
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage(index: 1)),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                // padding: const EdgeInsets.all(8),  
                child: Stack(
                  children: [
                Positioned(child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: const Color(0xfffaae25)
                  )
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
                      // blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      100,
                  ),
              )),
              const Positioned(child: Center(
                   child: Text('HSK 2급', style: TextStyle(fontSize: 20)),
                ))
                  ],
                ),
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage(index: 1)),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                // padding: const EdgeInsets.all(8),  
                child: Stack(
                  children: [
                Positioned(child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: const Color(0xfffaae25)
                  )
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
                      // blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      100,
                  ),
              )),
              const Positioned(child: Center(
                   child: Text('HSK 3급', style: TextStyle(fontSize: 20)),
                ))
                  ],
                ),
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage(index: 1)),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                // padding: const EdgeInsets.all(8),  
                child: Stack(
                  children: [
                Positioned(child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: const Color(0xfffaae25)
                  )
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
                      // blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      100,
                  ),
              )),
              const Positioned(child: Center(
                   child: Text('HSK 4급', style: TextStyle(fontSize: 20)),
                ))
                  ],
                ),
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage(index: 1)),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                // padding: const EdgeInsets.all(8),  
                child: Stack(
                  children: [
                Positioned(child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: const Color(0xfffaae25)
                  )
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
                      // blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      100,
                  ),
              )),
              const Positioned(child: Center(
                   child: Text('HSK 5급', style: TextStyle(fontSize: 20)),
                ))
                  ],
                ),
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage(index: 1)),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                // padding: const EdgeInsets.all(8),  
                child: Stack(
                  children: [
                Positioned(child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: const Color(0xfffaae25)
                  )
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
                      // blur: const MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 9,
                  size: const Size(
                      double.infinity,
                      100,
                  ),
              )),
              const Positioned(child: Center(
                   child: Text('HSK 6급', style: TextStyle(fontSize: 20)),
                ))
                  ],
                ),
              )),
            ],  
          )
          );
      case 2: 
      return const Center(
        child: WebView(
          initialUrl: 'https://chihome.co.kr/contact',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
      case 3: 
      return Column(
        children: const [
          Text("\n\n https://pub.dev/packages/kakao_flutter_sdk\n\n https://pub.dev/packages/google_sign_in\n\n https://pub.dev/packages/flutter_naver_login\n\n https://pub.dev/packages/sign_in_with_apple\n\n https://pub.dev/packages/swipable_stack\n\n https://pub.dev/packages/assets_audio_player\n\n https://pub.dev/packages/webview_flutter\n\n https://pub.dev/packages/url_launcher", style: TextStyle(fontSize: 15), textAlign: TextAlign.left)
        ],
      );
      default:
      return const Text("data");
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: const Text("차이홈 중국어"),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Center(
        child: SizedBox(child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            child: Image(image: AssetImage('images/logo.jpg')),
          ), width: 80, height: 80,),
        ),
      ),
      ListTile(
        title: const Text('중국어 단어공부'),
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
          setState(() {
            idx = 0;
          });
        },
      ),
      ListTile(
        title: const Text('Youtube'),
        onTap: () async {
          await launch("https://www.youtube.com/channel/UCQQM-2IIkZNEQJW0oEyKxJg");
          _scaffoldKey.currentState?.openEndDrawer();
          // setState(() {
          //   idx = 1;
          // });
        },
      ),
      ListTile(
        title: const Text('Contact us'),
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
          setState(() {
            idx = 2;
          });
        },
      ),
      ListTile(
        title: const Text('Opensource Policy'),
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
          setState(() {
            idx = 3;
          });
        },
      ),
    ],
  ),
),
      body: getBody(idx),
    ));
  }

}