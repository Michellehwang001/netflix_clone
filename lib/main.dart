import 'package:flutter/material.dart';
import 'package:netflix_clone/netflix_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            appBar: NetflixAppBar(
              isTop: _isTop,
            ),
            body: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if(notification.metrics.pixels == 0) {
                    _isTop = true;
                  } else {
                    _isTop = false;
                  }
                });
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABbHnaQCB_svwI0G5jr8e3RncCYALx09BCDJH2uhF0_xdCrS4DZ1B7M6TuHndYEHQAq80hSbU8L3Uji8Kwonk8RWqVay8.webp?r=c6e',
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 16,
                          bottom: 40,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height: _isTop ? 140 : 70,
                            child: Image.network(
                              'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/LmEnxtiAuzezXBjYXPuDgfZ4zZQ/AAAABVdFKBMen7V38j53KO7sYsiH_93NyAeZ1IGBNMxdoB_h6ekByN8ye2SsaLMEjB4YTeSQUT-PN3weFZQnze9VtszVwUDfoaNOG7hB.webp?r=2f8',
                            ),
                            curve: Curves.easeInOut,
                          )
                        ),
                      ],
                    ),
                    Container(
                      height: 2000,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
