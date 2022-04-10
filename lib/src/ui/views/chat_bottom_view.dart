import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/ui/model/msg_list_model.dart';
import 'package:gamer_tag_app/src/ui/pages/chat_page.dart';
import 'package:gamer_tag_app/src/ui/widgets/stack_images.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';
import 'package:gamer_tag_app/src/utils/nav.dart';
import 'package:gamer_tag_app/src/utils/top_tittle_row.dart';

class ChatBottomView extends StatefulWidget {
  const ChatBottomView({Key? key}) : super(key: key);

  @override
  _ChatBottomViewState createState() => _ChatBottomViewState();
}

class _ChatBottomViewState extends State<ChatBottomView> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Users').snapshots();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopTitleRow(
          title: 'MESSAGES',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Matches'),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: GestureDetector(
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                data['imageUrl'],
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: const TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                3 % 3 == 0
                                    ? const Text(
                                  'Lodon',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                )
                                    : Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      'New Match',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffffdfdf),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onTap: () {
                        AppNavigation.push(
                            context,
                            ChatPage(
                              img:  data['imageUrl'],
                              name:  data['name'],
                            ));
                      },
                    )


                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
