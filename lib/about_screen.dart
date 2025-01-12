import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final updater = ShorebirdUpdater();
  Patch? currentPatch;
  Patch? nextPatch;

  @override
  void initState() {
    getUpdateInfo();
    super.initState();
  }

  getUpdateInfo() async {
    Patch? _currentPatch = await updater.readCurrentPatch();
    Patch? _nextPatch = await updater.readNextPatch();
    setState(() {
      currentPatch = _currentPatch;
      nextPatch = _nextPatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us"),
      ),
      body: Column(
        children: [
          Text("Current Patch: ${currentPatch?.number}"),
          Text("Next Patch: ${nextPatch?.number}"),
        ],
      ),
    );
  }
}
