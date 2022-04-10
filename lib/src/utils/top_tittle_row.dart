import 'package:flutter/material.dart';

import 'images.dart';

class TopTitleRow extends StatelessWidget {
final  String title;

  const TopTitleRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            AppImages.appBlackLogo,
            width: 50,
          ),
        ],
      ),
    );
  }
}
