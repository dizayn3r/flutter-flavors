import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class UpdateScreen extends StatefulWidget {
  final ShorebirdUpdater updater;

  const UpdateScreen({super.key, required this.updater});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  Patch? currentPatch;
  Patch? nextPatch;

  @override
  void initState() {
    getUpdateInfo();
    super.initState();
  }

  getUpdateInfo() async {
    Patch? _currentPatch = await widget.updater.readCurrentPatch();
    Patch? _nextPatch = await widget.updater.readNextPatch();
    setState(() {
      currentPatch = _currentPatch;
      nextPatch = _nextPatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/software-update.png"),
            const SizedBox(height: 40),
            Text(
              "Time to Update",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "We added lots of new features and fix some bugs to make your experience as smooth as possible",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text("Current Patch: ${currentPatch?.number}"),
            Text("Next Patch: ${nextPatch?.number}"),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  widget.updater.update();
                },
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
