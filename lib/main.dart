import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Instagram '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title,
            style: const TextStyle(
              fontFamily: "DancingScript",
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            )),
        actions: const [
          Row(
            children: [
              Icon(Icons.heart_broken),
              SizedBox(width: 20.0),
              SizedBox(width: 10.0),
            ],
          )
        ],
      ),
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Add",
            icon: Icon(Icons.add),
          ),
          // BottomNavigationBarItem(
          //   label: "Reels",
          //   icon: Icon(Icons.play_arrow_rounded),
          // ),
          // BottomNavigationBarItem(
          //   label: "User",
          //   icon: Icon(Icons.circle),
          // ),
        ],
      ),
    );
  }
}

class bodyPage extends StatefulWidget {
  const bodyPage({super.key});

  @override
  State<bodyPage> createState() => _bodyPageState();
}

class _bodyPageState extends State<bodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < storyList.length; i++) ...[
                    SizedBox(width: 10.0),
                    Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              child: Text(""),
                            ),
                            if (i == 0) ...[
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: 35.0, vertical: 40.0),
                              //   child: Icon(Icons.add),
                              // ),
                              // SizedBox(
                              //   height: 20.0,
                              //   width: 20.0,
                              //   child: FloatingActionButton(
                              //     onPressed: () {},
                              //     child: Icon(Icons.add),
                              //   ),
                              // )
                            ]
                          ],
                        ),
                        Text("Your Story", style: TextStyle(fontSize: 10.0))
                      ],
                    )
                  ],

                  // CircleAvatar(
                  //   radius: 30.0,
                  //   child: Text("Hello"),
                  // ),
                  // CircleAvatar(
                  //   radius: 30.0,
                  //   child: Text("Hello"),
                  // ),
                  // CircleAvatar(
                  //   radius: 30.0,
                  //   child: Text("Hello"),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
