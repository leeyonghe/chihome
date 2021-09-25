import 'package:flutter/material.dart';
import 'wordpage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    MaterialPageRoute(builder: (context) => const WordPage()),
                  )
                },
                child: Container(  
                padding: const EdgeInsets.all(8),  
                child: const Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ),  
                color: Colors.yellow,  
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage()),
                  )
                  
                },
                child: Container(  
                padding: const EdgeInsets.all(8),  
                child: const Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ),  
                color: Colors.yellow,  
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage()),
                  )
                  
                },
                child: Container(  
                padding: const EdgeInsets.all(8),  
                child: const Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ),  
                color: Colors.yellow,  
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage()),
                  )
                  
                },
                child: Container(  
                padding: const EdgeInsets.all(8),  
                child: const Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ),  
                color: Colors.yellow,  
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage()),
                  )
                  
                },
                child: Container(  
                padding: const EdgeInsets.all(8),  
                child: const Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ),  
                color: Colors.yellow,  
              )),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordPage()),
                  )
                  
                },
                child: Container(  
                padding: const EdgeInsets.all(8),  
                child: const Center(
                   child: Text('HSK 1급', style: TextStyle(fontSize: 20)),
                ),  
                color: Colors.yellow,  
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
          Text("\n\nhttps://pub.dev/packages/kakao_flutter_sdk\n\nhttps://pub.dev/packages/flutter_naver_login\n\nhttps://pub.dev/packages/flutter_naver_login\n\nhttps://pub.dev/packages/sign_in_with_apple\n\nhttps://pub.dev/packages/swipable_stack\n\nhttps://pub.dev/packages/assets_audio_player\n\nhttps://pub.dev/packages/webview_flutter\n\nhttps://pub.dev/packages/url_launcher", style: TextStyle(fontSize: 15), textAlign: TextAlign.left)
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