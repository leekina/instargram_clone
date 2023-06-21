import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instargram_clone/src/app.dart';
import 'package:instargram_clone/src/controller/auth_controller.dart';
import 'package:instargram_clone/src/models/instagram_user.dart';

class SignUpPage extends StatefulWidget {
  final String uid;
  const SignUpPage({super.key, required this.uid});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nicnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? thumbnailXfild;

  void update() => setState(() {});

  Widget _avatar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 100,
            height: 100,
            child: thumbnailXfild != null
                ? Image.file(
                    File(thumbnailXfild!.path),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/default_image.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            thumbnailXfild = await _picker.pickImage(
                source: ImageSource.gallery, imageQuality: 100);
            update();
          },
          child: const Text("이미지 변경"),
        ),
      ],
    );
  }

  Widget _nicname() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nicnameController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10), hintText: 'nicname'),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: descriptionController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10), hintText: 'description'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            _avatar(),
            const SizedBox(height: 30),
            _nicname(),
            const SizedBox(height: 30),
            _description(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ElevatedButton(
          onPressed: () {
            //validation
            var signUpData = IUser(
              uid: widget.uid,
              nicname: nicnameController.text,
              description: descriptionController.text,
            );
            AuthController.to.signUp(signUpData, thumbnailXfild);
          },
          child: const Text('회원가입'),
        ),
      ),
    );
  }
}
