import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';

import '../../utils/images.dart';

class StackImages extends StatelessWidget {
  const StackImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120), color: Colors.black),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Container(
                padding: const EdgeInsets.only(right: 5),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Align(
                  child: Text(
                    '13',
                    style: TextStyle(
                      color: AppColors.yellowColor,
                      fontSize: 20,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.person),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.person2), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.person1), fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
