import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:instargram_clone/src/components/avatar_widget.dart';
import 'package:instargram_clone/src/components/image_data.dart';
import 'package:instargram_clone/src/components/imagepath.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarWidget(
              type: AvatarType.TYPE3,
              thumbPath:
                  'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg',
              size: 40,
              nickName: "kina",
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_horiz,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _image() {
      return CachedNetworkImage(
          imageUrl:
              'https://atonce.com/landing//art/AI%20Art%20Generator%20From%20Text%20Fox%20Laser.png');
    }

    Widget _infoCount() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageData(
                  IconsPath.likeOffIcon,
                  width: 80,
                ),
                const SizedBox(width: 10),
                ImageData(
                  IconsPath.replyIcon,
                  width: 80,
                ),
                const SizedBox(width: 10),
                ImageData(
                  IconsPath.directMessage,
                  width: 80,
                ),
              ],
            ),
            ImageData(
              IconsPath.bookMarkOffIcon,
              width: 70,
            ),
          ],
        ),
      );
    }

    Widget _infoDescription() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '좋아요 1.172개',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            ExpandableText(
              "asdfasdfasdf\nasdfasdfasdf\nasdfasdfasdf\nasdfasdfasdf\n",
              prefixText: 'kina',
              onPrefixTap: () {}, //프로필로 이동
              prefixStyle: TextStyle(fontWeight: FontWeight.bold),
              expandText: '더보기',
              collapseText: '접기',
              maxLines: 3,
              expandOnTextTap: true,
              collapseOnTextTap: true,
              linkColor: Colors.grey,
            )
          ],
        ),
      );
    }

    Widget _replyTextBtn() {
      return GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('댓글 30개 모두 보기', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      );
    }

    Widget _dateAgo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('1일 전',
                style: TextStyle(color: Colors.grey, fontSize: 10)),
          ),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 20),
      //height: 300,
      child: Column(
        children: [
          _header(),
          SizedBox(height: 5),
          _image(),
          SizedBox(height: 5),
          _infoCount(),
          SizedBox(height: 5),
          _infoDescription(),
          SizedBox(height: 5),
          _replyTextBtn(),
          SizedBox(height: 5),
          _dateAgo(),
        ],
      ),
    );
  }
}
