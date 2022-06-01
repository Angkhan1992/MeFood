import 'package:flutter/material.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  final String title;

  WebviewScreen({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
