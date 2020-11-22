import 'package:flutter/cupertino.dart';
import 'package:moove/domain/id.dart';

class CommunityListElement {
  String name;
  AssetImage image;
  Id id;

  CommunityListElement(String name, AssetImage image) {
    this.name = name;
    this.image = image;
  }
}
