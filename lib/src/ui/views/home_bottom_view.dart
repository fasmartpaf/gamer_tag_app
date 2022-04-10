import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/Model/currentUer.dart';
import 'package:gamer_tag_app/src/ui/widgets/stack_images.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';
import 'package:gamer_tag_app/src/utils/images.dart';
import 'package:gamer_tag_app/src/utils/top_tittle_row.dart';

class HomeBottomView extends StatefulWidget {
  const HomeBottomView({Key? key}) : super(key: key);

  @override
  _HomeBottomViewState createState() => _HomeBottomViewState();
}

class _HomeBottomViewState extends State<HomeBottomView> {
  bool isTrue = false;
@override
  void initState() {
    // TODO: implement init
  //  State
    super.initState();
    getImage();
  }
  getImage(){
    FirebaseFirestore.instance
        .collection('Game')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {

          game.add(doc["image"].toString());
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopTitleRow(
          title: 'MatchRoom',
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: StackImages(),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.pinkColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.more_vert, color: Colors.white))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SwipeImage(),
                  isTrue
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    child: const CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        size: 45,
                                        color: Colors.black12,
                                      ),
                                    ),
                                    onTap: () {
                                      isTrue = !isTrue;
                                      setState(() {});
                                    },
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      '40 MILES AWAY\nLONDON',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Favourite Games'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return ClipRRect(
                                          child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: AssetImage(i % 2 == 0
                                                ? AppImages.game2
                                                : AppImages.game),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        height: 120,
                                        width: 120,
                                      ));
                                    },
                                    separatorBuilder: (c, k) {
                                      return const SizedBox(
                                        width: 15,
                                      );
                                    },
                                    itemCount: 20),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.yellowColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    const Text(
                                      'BIO',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const Text(
                                        'Heyy I’m Katie or Kate\nI’m 23\nI really like anime, video games, cosplay and \nmarvel and dc\nFav Anime is my future diary\nInstagram: Katie03',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 30, top: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.pinkColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            const Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_pin,
                                    color: Colors.red,
                                  ),
                                  const Text(
                                    '40 MILES AWAY\nLONDON',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      isTrue = !isTrue;
                                      setState(() {});
                                    },
                                    child: Image.asset(
                                      AppImages.info,
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.cover,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GameBuild(),
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.disLike,
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  AppImages.like,
                                  width: 80,
                                  height: 80,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )
                          ],
                        )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }



  Widget _buildGameGrid({required String url}) {
    return ClipRRect(
        child: Column(
          children: [
            Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(url),
              fit: BoxFit.cover,
            ),
      ),
      height: 50,
      width: 50,
    ),
          ],
        ));
  }
}

class SwipeImage extends StatefulWidget {
  const SwipeImage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}
class GameBuild extends StatefulWidget {
  const GameBuild({Key? key}) : super(key: key);

  @override
  _GameBuildState createState() => _GameBuildState();
}

class _GameBuildState extends State<GameBuild> {
  Widget _buildGameGrid({required String url}) {
    return ClipRRect(
        child: Column(

          children: [

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
              height: 50,
              width: 50,
            ),
          ],
        ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }
List name=[];
  getImage(){
    FirebaseFirestore.instance
        .collection('Game')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {

          game.add(doc["image"].toString());


        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.yellowColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favourite Games'.toUpperCase(),
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          // ListView.builder
          //   (
          //     itemCount: game.length,
          //     itemBuilder: (BuildContext ctxt, int index) {
          //       return _buildGameGrid(url: game[0]);
          //     }
          // ),
         Container(
           height: 80,
            
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: game.map((e) => _buildGameGrid(url: e)).toList()),
          )
              
            //   _buildGameGrid(url: game[0]),
            //   const SizedBox(width: 10),
            //   _buildGameGrid(url: game[1]),
            //   const SizedBox(width: 10),
            //   _buildGameGrid(url: game[2]),
            //   const SizedBox(width: 10),
            //   _buildGameGrid(url:game[3]),
            //   const SizedBox(width: 10),
            //   _buildGameGrid(url: game[4]),
            // ],

        ],
      ),
    );
  }
}

class _CarouselWithIndicatorState extends State<SwipeImage> {
  double childAspectRatio = 1;
  double crossAxisSpace = 2;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }
  List name=[];
  getImage(){
    FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {

          imgList.add(doc["imageUrl"].toString());
          name.add(doc['name'].toString());
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(

          items: imgList
              .map(
                (item) => ClipRRect(

                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              )

              .toList(),
          options: CarouselOptions(
              height: 270,
              viewportFraction: 0.6,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                });
              }),
        ),
      ],
    );
  }

  // final List<Widget> imageSliders = imgList
  //     .map(
  //       (item) => Image.network(item, width: 1700.0),
  //     )
  //     .toList();
}

final List<String> imgList = [];
final List<String> game = [];