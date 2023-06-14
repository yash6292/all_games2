import 'package:flutter/material.dart';

class UndefinedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Route is Not Defined"),
        ),
      ),
    );
  }
}
