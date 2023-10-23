import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatefulWidget {
  const CircularProgressIndicatorWidget({super.key});

  @override
  State<CircularProgressIndicatorWidget> createState() => _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState extends State<CircularProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Color.fromRGBO(225, 6, 0, 1),),
    );
  }
}