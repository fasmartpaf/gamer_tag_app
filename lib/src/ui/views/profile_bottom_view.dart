
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';
import 'package:gamer_tag_app/src/utils/images.dart';
import 'package:gamer_tag_app/src/utils/top_tittle_row.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:shared_preferences/shared_preferences.dart';
class ProfileBottomView extends StatefulWidget {
  const ProfileBottomView({Key? key}) : super(key: key);
  @override
  _ProfileBottomViewState createState() => _ProfileBottomViewState();
}
class _ProfileBottomViewState extends State<ProfileBottomView> {
  final picker = ImagePicker();
  File? _imageFile=null;
  String imagUrl='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getid();
    getImage();
       getgames();

  }
 
  getid() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    uid=sharedPreferences.getString('uid')!;
  }
  FirebaseFirestore firebasefirestore=FirebaseFirestore.instance;
  final List<String> images = [];
  final List<String> game = [];


getImage(){
  FirebaseFirestore.instance
      .collection('ProfileUrl').where('id',isNotEqualTo: uid)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      setState(() {

        images.add(doc["image"].toString());
      });
    });
  });
}
  getgames(){
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


  void _settingModalBottomSheet(BuildContext context, String coll) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () => {
                    pickImageGallery(coll)
                  }),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () => {

                  pickImageCamera(coll),
                },
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TopTitleRow(

            title: 'My Profile',
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.pinkColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildButtonRow(),
                    _buildPersonContainer(context),
                    const Center(
                      child: Text('Hold, drag and drop to reorder your photos',style: TextStyle(fontSize: 10),),
                    ),
                    _buildGameContainer(context),
                    _buildTextContainer(),
                  ],
                ),
                padding: const EdgeInsets.all(10),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextContainer() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'EDIT BIO',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Hi, my favourite drink is champagne I go on snowboarding trip every month I like to chill in my luxury yatch just kidding, I just play a lot of games',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: [
        _buildText(text: 'Cancel'),
        const Spacer(),
        _buildText(text: 'March,23'),
        Image.asset(
          AppImages.male,
          height: 20,
          width: 20,
        ),
        const Spacer(),
        _buildText(text: 'Save'),
      ],
    );
  }

  Widget _buildGameContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Text(
            'Favourite Games',
            style: TextStyle(fontSize: 13),
          ),
          GameBuild(),
         SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildAddGameImage(context),
              const SizedBox(width: 5),
              _buildAddGameImage(context),
              const SizedBox(width: 5),
              _buildAddGameImage(context),
              const SizedBox(width: 5),
              _buildAddGameImage(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddGameImage(BuildContext context) {
    return GestureDetector(
      onTap: (){

        _settingModalBottomSheet(context,'Game');

      },
      child: Image.asset(
        AppImages.addGame,
        height: 70,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPersonContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: images.map((e) => _buildPersonGrid(url: e)).toList()),
          ),
              // _buildPersonGrid(url: images[0]),
              // const SizedBox(width: 10),
              // _buildPersonGrid(url: images[1],),
              // const SizedBox(width: 10),
              // _buildPersonGrid(url: images[1]),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: (){
_settingModalBottomSheet(context,'ProileImages');
                },
                child: Image.asset(
                  AppImages.addPic,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: (){
                  _settingModalBottomSheet(context,'ProileImages');
                },
                child: Image.asset(
                  AppImages.addPic,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: (){
                  _settingModalBottomSheet(context,'ProileImages');
                },
                child: Image.asset(
                  AppImages.addPic,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Future pickImageGallery(String col) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    uploadImageToFirebase(col );
  }

  Future pickImageCamera(String collection) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    uploadImageToFirebase(collection);
  }

  Future uploadImageToFirebase(String col) async {
    SharedPreferences shared1= await SharedPreferences.getInstance();
    String fileName = basename(_imageFile!.path);
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance
        .ref().child('uploads').child('/$fileName');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': fileName});
    firebase_storage.UploadTask uploadTask;
    //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    uploadTask = ref.putFile(io.File(_imageFile!.path), metadata);

    firebase_storage.UploadTask task= await Future.value(uploadTask);
    Future.value(uploadTask).then((value) async => {
      imagUrl= (await ref.getDownloadURL()).toString(),
      //   setState(() {
      // imagUrl =ref.getDownloadURL() as String;
      //   }),
      print("Upload file path ${value.ref.fullPath}"),
      print(imagUrl),
      firebasefirestore.collection(col).add({
        'image':imagUrl,
        'id':shared1.getString('uid'),
      })
    }).onError((error, stackTrace) => {
      print("Upload file path error ${error.toString()} ")
    });



  }



  Widget _buildText({required String text}) {
    return GestureDetector(
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
      ),
      onTap: () {},
    );
  }

  Widget _buildGameGrid({required String url}) {
    return Expanded(
      child: ClipRRect(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image:NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        height: 85,
      )),
    );
  }

  Widget _buildPersonGrid({required String? url}) {
    return Expanded(
      child: ClipRRect(
          child: Container(
            width: 100,
            margin: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
        ////
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(url!),
            fit: BoxFit.cover,
          ),
        ),
        height: 180,
      )),
    );
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
        .collection('Game').where('id',isNotEqualTo: uid)
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
final List<String> game=[];
String uid='';