import 'package:flutter/material.dart';
import 'mainpage.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<LoginPage> {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Container(
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Center(
            child: Stack(
                    children: <Widget>[
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // wrap height
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // stretch across width of screen
                          children: <Widget>[
                            const SizedBox(child: Image(image: AssetImage('images/logo.jpg')), width: 200, height: 200,),
                            _buildKakaoLoginButton(),
                            _buildNaverLoginButton(),
                            _buildAppleLoginButton(),
                          ],
                        ),
                      )
                    ],
                  )
          )),
    ));
  }

Container _buildAppleLoginButton() {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
      child: ElevatedButton(
           style: style,
           onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              )
           },
           child: const Text('Apple'),
      ));
}

Container _buildNaverLoginButton() {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
      child: ElevatedButton(
           style: style,
           onPressed:  () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              )

           },
           child: const Text('Naver'),
      ));
}

Container _buildKakaoLoginButton() {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
      child: ElevatedButton(
           style: style,
           onPressed:  () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              )

           },
           child: const Text('Kakao'),
      ));
}

}