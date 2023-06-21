import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopUp extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallBack;
  final Function()? cancelCallBack;

  const MessagePopUp({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallBack,
    this.cancelCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              width: Get.width * 0.7,
              child: Column(
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    message!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: okCallBack,
                        child: const Text("확인"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: cancelCallBack,
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        child: const Text("취소"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
