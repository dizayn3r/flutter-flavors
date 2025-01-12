import 'package:flutter/material.dart';
import 'package:flutter_flavors/about_screen.dart';
import 'package:flutter_flavors/app_environment.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image setImage(Environment env) {
    switch (env) {
      case Environment.dev:
        return Image.asset("assets/icons/dev_icon.png");
      case Environment.staging:
        return Image.asset(
          "assets/icons/staging_icon.png",
          color: Colors.greenAccent,
          colorBlendMode: BlendMode.hue,
        );
      case Environment.prod:
        return Image.asset("assets/icons/prod_icon.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.settings_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: setImage(AppEnvironment.environment),
          ),
          Text(
            AppEnvironment.apiUrl,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
