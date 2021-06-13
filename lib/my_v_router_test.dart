import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class MyVRouterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: "v Router",
      initialUrl: '/',
      routes: [
        VWidget(
            path: "/",
            name: "home",
            aliases: [],
            widget: MyHomePage(
              title: "Home",
            )),
        VWidget(
            path: "/login",
            name: "Login",
            aliases: ["/Login"],
            widget: Loginpage()),
        VWidget(path: "/post/:id", name: "post", widget: Posts())
      ],
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
                onTap: () {},
              ),
              ListTile(
                title: Text("Post2"),
                onTap: () {},
              ),
              ElevatedButton(
                  onPressed: () {
                    context.vRouter.push("/login");
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
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List posts = [
    {"userid": 1, "id": 1, "title": "sunt our repple", "body": "body"},
    {"userid": 1, "id": 2, "title": "title 2", "body": "this data is id 2"}
  ];

  Future<Map> getData(int id) async {
    Map data = posts.firstWhere((element) => element['id'] == id);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    int id = int.parse(VRouter.of(context).pathParameters['id'] ?? '1');
    return Scaffold(
      appBar: AppBar(
        title: Text("I am post $id"),
      ),
      body: FutureBuilder(
        future: getData(id),
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
