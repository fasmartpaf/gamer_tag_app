import 'package:flutter/material.dart';

class DecoratedContainer extends StatefulWidget {
  final Widget child;
final  double? padding;

  const DecoratedContainer({Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  _DecoratedContainerState createState() => _DecoratedContainerState();
}

class _DecoratedContainerState extends State<DecoratedContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:  EdgeInsets.all(widget.padding??10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: widget.child,
      ),
    );
  }
}
