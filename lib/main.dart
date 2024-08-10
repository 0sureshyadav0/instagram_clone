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
              Icon(Icons.favorite_border),
              SizedBox(width: 20.0),
              // Image(image: AssetImage("./assets/icons/messenger.svg")),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < storyList.length; i++) ...[
                  SizedBox(width: 10.0),
                  Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage("${storyList[i][1]}"),
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
                      Text("${storyList[i][0]}",
                          style: TextStyle(fontSize: 10.0))
                    ],
                  )
                ],
              ],
            ),
          ),
          postList(),
        ],
      ),
    );
  }
}

class postList extends StatefulWidget {
  const postList({super.key});

  @override
  State<postList> createState() => _postListState();
}

class _postListState extends State<postList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0),
        Container(
          height: MediaQuery.of(context).size.height / 1.3,
          // color: Colors.red,
          child: Column(
            children: [
              ListTile(
                // tileColor: Colors.green,
                contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
                leading: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage(
                    "${storyList[0][1]}",
                  ),
                ),
                minTileHeight: 5.0,
                minVerticalPadding: 1.0,
                title: Text("${storyList[0][0]}",
                    style: TextStyle(fontSize: 13.0)),
                subtitle: Text("${storyList[0][0]}",
                    style: TextStyle(fontSize: 10.0)),
                trailing: Icon(Icons.menu),
              ),
              Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height / 2,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network("${storyList[0][1]}")),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.favorite_border_outlined),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(Icons.chat_rounded),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(Icons.share),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.7,
                          ),
                          Icon(Icons.bookmark_border),
                        ],
                      ),
                      Text("Liked by suvamvlog11 and others",
                          style: TextStyle(fontSize: 13.0)),
                      Text("swostika.acharya.00",
                          style: TextStyle(fontSize: 13.0)),
                      Text("View 1 comment",
                          style: TextStyle(fontSize: 13.0, color: Colors.grey)),
                      Text("53 minutes ago",
                          style: TextStyle(fontSize: 13.0, color: Colors.grey))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
