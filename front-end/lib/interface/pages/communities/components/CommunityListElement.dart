import 'package:flutter/cupertino.dart';

class CommunityListElement {
  String name;
  AssetImage image;
  int id;

  CommunityListElement(String name, AssetImage image) {
    this.name = name;
    this.image = image;
  }
}