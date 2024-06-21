import 'package:flutter/widgets.dart';

class NFTModel{
  String name;
  String description;
  String image;
  double price;
  bool isSold;

  NFTModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isSold
  });
}