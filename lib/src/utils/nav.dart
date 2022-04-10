import 'package:flutter/material.dart';

abstract class AppNavigation {
  static Future<dynamic> push(
    BuildContext context,
    Widget widget,
  ) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  static pushReplacement(
    BuildContext context,
    Widget widget,
  ) {
    return Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => widget,
      ),
      (route) => false, //if you want to disable back feature set to false
    );
  }

  static pop(BuildContext context, [dynamic data]) {
    return Navigator.of(context).pop(data);
  }
}
