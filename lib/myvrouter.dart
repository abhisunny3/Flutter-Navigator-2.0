import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyVApp extends StatelessWidget {
  // velocity x navigator 2.0 example

  final _routerDeletegate = VxNavigator(routes: {
    '/': (uri, params) =>
        MaterialPage(child: MyHomePage(title: 'Flutter Demo Home Page')),
    '/login': (uri, params) => MaterialPage(child: Loginpage()),
    '/post': (uri, params) {
      print(uri.queryParameters['id']);
      // print(params);
      int id = int.parse(uri.queryParameters['id'] ?? 1);
      return MaterialPage(
          child: Posts(
        id: id,
      ));
    },
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Velocity Nov Test",
      routeInformationParser: VxInformationParser(),
      routerDelegate: _routerDeletegate,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sunny Kumar',
              ),
              ListTile(
                title: Text("Post1"),
                onTap: () {
                  VxNavigator.of(context)
                      .push(Uri(path: "/post", queryParameters: {"id": "1"}));
                },
              ),
              ListTile(
                title: Text("Post2"),
                onTap: () {
                  VxNavigator.of(context)
                      .push(Uri(path: "/post", queryParameters: {"id": "2"}));
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    VxNavigator.of(context).push(Uri.parse("/login"));
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}

class Posts extends StatefulWidget {
  final int id;

  const Posts({Key key, this.id}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List posts = [
    {"userid": 1, "id": 1, "title": "sunt our repple", "body": "body"},
    {"userid": 1, "id": 2, "title": "title 2", "body": "this data is id 2"}
  ];

  Future<Map> getData() async {
    Map data = posts.firstWhere((element) => element['id'] == widget.id);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I am post ${widget.id}"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return Text("${snapshot.data}");
        },
      ),
    );
  }
}

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
    );
  }
}
