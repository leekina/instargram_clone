import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double gridViewDefaultHeight = Get.width / 3;
  List<List<int>> groupBox = [[], [], []];

  @override
  void initState() {
    super.initState();
    bool rout = true;

    //1세트
    for (var i = 0; i < 10; i++) {
      var gi = i % 3;
      var gii = i % 9;
      var giii = i % 10;
      var size = 1;

      //하나의 그리드 생성
      if ((gi == 0 && gii == 0) || (gi == 2 && gii == 8)) {
        size = 2;
      }
      //10번째 예외처리
      if (giii == 9) {
        groupBox[1].add(1);
      } else {
        groupBox[gi].add(size);
      }
    }
    print(groupBox);
  }

  @override
  Widget build(BuildContext context) {
    Widget _appbar() {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Row(children: [
                Icon(Icons.search),
              ]),
            ),
          ),
        ],
      );
    }

    Widget _body() {
      return SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: List.generate(
                  groupBox[index].length,
                  (jndex) => Container(
                    //child: Text("$index $jndex"),
                    height: gridViewDefaultHeight * groupBox[index][jndex],
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTbJ6q6nCvC-F8ctwjE8F_gh176HK1p-EcKg&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ).toList(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _appbar(),
          Expanded(child: _body()),
        ]),
      ),
    );
  }
}
