import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instargram_clone/src/binding/init_bindings.dart';
import 'package:instargram_clone/src/models/instagram_user.dart';
import 'package:instargram_clone/src/repository/user_repository.dart';
import 'package:quiver/time.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async {
    //DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    if (userData != null) {
      user(userData);
      InitBinding.additionalBinding();
    }
    return userData;
  }

  void signUp(IUser signupUser, XFile? thumbnail) async {
    //썸네일이 없으면
    if (thumbnail == null) {
      _submitSignup(signupUser);
    } else {
      //썸네일이 있으면
      var task = uploadXFile(thumbnail,
          '${signupUser.uid}/profile.${thumbnail.path.split('.').last}');
      task.snapshotEvents.listen((event) async {
        //올라간 양 찍기
        print(event.bytesTransferred);
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          //클로닝... 안정성을 위해서?
          var updatedUserData = signupUser.copyWith(thumbnail: downloadUrl);
          _submitSignup(updatedUserData);
        }
      });
    }
  }

  UploadTask uploadXFile(XFile file, String filename) {
    var f = File(file.path);
    var ref = FirebaseStorage.instance.ref().child('users').child(filename);
    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});
    return ref.putFile(f, metadata);
    //users/{uid}/profile.~
  }

  void _submitSignup(IUser signupUser) async {
    var result = await UserRepository.signUp(signupUser);
    if (result) {
      loginUser(signupUser.uid!);
    }
  }
}
