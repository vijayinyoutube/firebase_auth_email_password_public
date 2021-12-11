import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget implements PreferredSizeWidget {
  const AppBarClass({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class HeightSpacer extends StatelessWidget {
  final double myHeight;

  const HeightSpacer({Key? key, required this.myHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myHeight,
    );
  }
}

class WidthSpacer extends StatelessWidget {
  final double myWidth;

  const WidthSpacer({Key? key, required this.myWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: myWidth,
    );
  }
}
