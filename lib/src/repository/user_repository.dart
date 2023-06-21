import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instargram_clone/src/models/instagram_user.dart';

class UserRepository {
  static Future<IUser?> loginUserByUid(String uid) async {
    print(uid);
    //users에서 uid 필드를 찾음
    //파이어베이스 파이어스토어의 문법, 규칙임
    //유저스라는 컬렉션에서 uid 해서 동일한거 get 한다
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return IUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signUp(IUser user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
