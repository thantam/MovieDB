import 'package:flutter/material.dart';

class InkinoAppBar extends StatefulWidget {
  @override
  _InkinoAppBarState createState() => _InkinoAppBarState();
}

class _InkinoAppBarState extends State<InkinoAppBar>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: _Title(),
    );
  }
}

class _Title extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return Text(
          'Title',
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white70,
          ),
        );
  }
}
