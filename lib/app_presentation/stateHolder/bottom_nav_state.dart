import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:get/get.dart';

class BottomNavState extends GetxController {
  int _currentIndex = 0;

  int get stateIndex => _currentIndex;

  Future<void> onTapIndex(int index) async {
    if (_currentIndex == index) {
      return;
    } else if (index == 2 || index == 3) {
      bool isLoggedIn = await AuthController.isLoggedIn();
      if (isLoggedIn) {
        _currentIndex = index;
        update();
      } else {
        Get.off(() => const VerifyEmailScreen());
      }
    } else {
      _currentIndex = index;
      update();
    }
  }

  void backHome() {
    onTapIndex(0);
  }
}
