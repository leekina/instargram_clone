import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instargram_clone/src/components/message_pop_up.dart';
import 'package:instargram_clone/src/pages/upload.dart';

//인덱스를 추가하여 스위치문으로 읽기 쉽게 구성가능
enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

//네비게이션 컨트롤러
class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  //업로드를 제외한 나머지 페이지에서만 페이지 전환이 이루어져야함
  //업로드는 업로드페이지로 이동해야함 팝업이 되야함
  //그래서 함수로 빼서 Upload 페이지를 제외한 페이지에 넣어줌
  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    //뒤로가기버튼 처리
    if (!hasGesture) return;

    //히스토리 예외처리
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopUp(
                title: '시스템',
                message: '종료하시겠습니까?',
                okCallBack: () {
                  exit(0);
                },
                cancelCallBack: Get.back,
              ));
      print('Exit');
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}
