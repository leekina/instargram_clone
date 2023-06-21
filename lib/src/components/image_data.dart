import 'package:flutter/material.dart';
import 'package:get/get.dart';

//이미지 에셋 해주는 클래스
class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  //width값을 받는경우에는 width값을 따르고 없을때는 55 고정
  ImageData(
    this.icon, {
    Key? key,
    this.width = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon, width: width! / Get.mediaQuery.devicePixelRatio);
  }
}
