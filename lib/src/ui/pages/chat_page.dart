import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';
import 'package:gamer_tag_app/src/utils/images.dart';
import 'package:gamer_tag_app/src/utils/nav.dart';

class ChatPage extends StatefulWidget {
 final String name;
 final String img;

  const ChatPage({Key? key, required this.name, required this.img}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 8),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          AppImages.backArrow,
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          AppNavigation.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ClipRRect(
                        child: Image.asset(
                          AppImages.person2,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(120),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'KATTE',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '2 hours',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Image.asset(
                          AppImages.info,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                ),
                Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (c, i) {
                          return i % 2 == 0
                              ? Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery
                                        .of(context)
                                        .size
                                        .width /
                                        4),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        AppImages.person2,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(120),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                horizontal: 8,
                                                vertical: 15,
                                              ),
                                              // width: MediaQuery.of(context).size.width / 2,
                                              margin: const EdgeInsets.only(
                                                  bottom: 1),
                                              decoration: BoxDecoration(
                                                color: AppColors.pinkColor,
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: const Text(
                                                'you down to play some valorant?',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10),
                                              child: Text('20:25'),
                                            )
                                          ],
                                        )),
                                  ],
                                )),
                          )
                              : Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery
                                        .of(context)
                                        .size
                                        .width /
                                        4),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                horizontal: 8,
                                                vertical: 15,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  bottom: 1),
                                              decoration: BoxDecoration(
                                                color: AppColors.pinkColor,
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: const Text(
                                                'Hey Katie, how u doin?',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            const Text('20:25'),
                                          ],
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ClipRRect(
                                      child: Image.asset(
                                        AppImages.person1,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(120),
                                    ),
                                  ],
                                )),
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(height: 30);
                        },
                        itemCount: 20)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.voice,
                        height: 55,
                        width: 35,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            controller: _chatTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter a new message',
                              suffixIcon: Image.asset(
                                AppImages.chatColoredBottom,
                                color: Colors.black,
                              ),
                              suffixIconConstraints: BoxConstraints.tight(
                                const Size(25, 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        backgroundColor: AppColors.yellowColor);
  }
}
