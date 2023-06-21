import 'package:get/instance_manager.dart';
import 'package:instargram_clone/src/controller/auth_controller.dart';
import 'package:instargram_clone/src/controller/bottom_nav_controller.dart';
import 'package:instargram_clone/src/controller/mypage_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    //앱이 종료 될때까지 인스턴스가 살아있게 즉, 동작하게
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }

  //추가적인 바인딩 작업
  static additionalBinding() {
    Get.put(MyPageController(), permanent: true);
  }
}
