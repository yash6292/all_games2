import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/lunch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(top: 15),
          insetPadding: const EdgeInsets.all(15),
          contentPadding: const EdgeInsets.only(top: 10, bottom: 25),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding:
              const EdgeInsets.only(right: 20, bottom: 10, left: 20),
          actions: [
            ElevatedButton(
              onPressed: () => SystemNavigator.pop(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800),
              child: const Text("Yes"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text("No", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () => launchURL(url: StringConstant.appUrl),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child:
                  const Text("Rate Us", style: TextStyle(color: Colors.black)),
            )
          ],
          title: Column(
            children: [
              Icon(Icons.exit_to_app_rounded,
                  size: 35, color: Colors.red.shade800),
              const SizedBox(height: 5),
              const Text("Are you sure?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content:
              const Text("Do you want to exit?", textAlign: TextAlign.center),
        );
      });
}
