import 'package:all_games2/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class Loadder extends StatelessWidget {
  const Loadder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(color: colorAppTheme)));
  }
}
