import 'package:flutter/material.dart';
import 'mainpage.dart';

import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<LoginPage> {
  
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });

  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
      return;
    }
  }

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
                            _buildGoogleLoginButton(),
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



double getScreenWidth(){
  return MediaQuery.of(context).size.width*0.6;
}

Container _buildGoogleLoginButton() {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 16, right: 30, bottom: 0),
      child: ElevatedButton(
           style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(getScreenWidth(),45)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 20))
            ),
           onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              )
              // _googleSignIn.signInSilently()
           },
           child: const Text('Google'),
      ));
}

Container _buildAppleLoginButton() {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 16, right: 30, bottom: 0),
      child: ElevatedButton(
           style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(getScreenWidth(),45)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 20))
            ),
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
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 16, right: 30, bottom: 0),
      child: ElevatedButton(
           style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(getScreenWidth(),45)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 20))
            ),
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
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 16, right: 30, bottom: 0),
      child: ElevatedButton(
           style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(getScreenWidth(),45)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 20))
            ),
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