import 'package:flutter/material.dart';

class AppBarIconButtonWidget extends StatefulWidget {
 final IconData icon;

final  VoidCallback onTap;

  const AppBarIconButtonWidget({Key? key, required this.onTap, required this.icon}) : super(key: key);

  @override
  _AppBarIconButtonWidgetState createState() => _AppBarIconButtonWidgetState();
}

class _AppBarIconButtonWidgetState extends State<AppBarIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onTap,
      icon: Icon(
        widget.icon,size: 35,
      ),
    );
  }
}
