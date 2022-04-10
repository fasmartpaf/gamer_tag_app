import 'package:gamer_tag_app/src/utils/images.dart';

class MsgListModel {
  String url;
  String name;
  String country;

  MsgListModel({
    required this.url,
    required this.name,
    required this.country,
  });
}

List<MsgListModel> msgData = [
  MsgListModel(url: AppImages.msg, name: "Anna 21", country: 'London'),
  MsgListModel(url: AppImages.msg1, name: "Julie 29", country: 'Brighton'),
  MsgListModel(url: AppImages.msg2, name: "Shannon 22", country: 'London'),
  MsgListModel(url: AppImages.msg3, name: "Tanya 23", country: 'Oxford'),
  MsgListModel(url: AppImages.msg4, name: "Katie 23", country: 'Brighton'),
  MsgListModel(url: AppImages.msg5, name: "Tanya 23", country: 'London'),
];
