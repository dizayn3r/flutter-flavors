import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class UpdateScreen extends StatelessWidget {
  final UpdateStatus updateStatus;

  const UpdateScreen({super.key, required this.updateStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Available')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              updateStatus.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for navigating to update page or app store
              },
              child: const Text('Update Now'),
            ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate back to the home screen if the user doesn't want to update
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home')),
            //     );
            //   },
            //   child: const Text('Skip Update'),
            // ),
          ],
        ),
      ),
    );
  }
}
