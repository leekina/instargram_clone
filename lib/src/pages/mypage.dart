import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instargram_clone/src/components/avatar_widget.dart';
import 'package:instargram_clone/src/components/image_data.dart';
import 'package:instargram_clone/src/components/imagepath.dart';
import 'package:instargram_clone/src/controller/auth_controller.dart';
import 'package:instargram_clone/src/controller/mypage_controller.dart';

class MyPage extends GetView<MyPageController> {
  MyPage({super.key});

  Widget _statisticsOne(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _infomation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                AvatarWidget(
                  type: AvatarType.TYPE4,
                  thumbPath: controller.targetUser.value.thumbnail!,
                  size: 80,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _statisticsOne('게시물', 103),
                      _statisticsOne('팔로워', 114),
                      _statisticsOne('팔로잉', 152),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              controller.targetUser.value.description!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "핢",
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text('프로필 편집'),
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text('프로필 공유'),
              ),
            ),
          ),
          SizedBox(width: 5),
          SizedBox(
            height: 30,
            width: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(5)),
              child: Icon(
                Icons.person_add,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabMenu() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TabBar(
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        controller: controller.tabController,
        tabs: [
          Container(child: ImageData(IconsPath.gridViewOn)),
          Container(child: ImageData(IconsPath.myTagImageOff)),
          Container(
              child: Icon(
            Icons.movie_creation_outlined,
            color: Colors.grey,
          )),
        ],
      ),
    );
  }

  Widget _tabView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: ((context, index) {
        return Container(
          color: Colors.grey,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Obx(
          () => Text(
            controller.targetUser.value.nicname ?? '',
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ImageData(
                IconsPath.uploadIcon,
                width: 60,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ImageData(
                IconsPath.menuIcon,
                width: 60,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _infomation(),
            _menu(),
            SizedBox(
              height: 20,
            ),
            _tabMenu(),
            _tabView(),
          ],
        ),
      ),
    );
  }
}
