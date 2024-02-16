import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/utilities/assets_path.dart';
import '../ui/widgets/app_bar_icon_home.dart';

class ShowAppBar extends GetxController {
  
  AppBar appData(BuildContext context) {
    return AppBar(
      title: Image.asset(AssetsPath.logoNavPath),
      actions: [
        AppBarIcons(
          onTap: () {
            showDialog(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: TextButton(onPressed: (){
                         Get.back();
                        }, child: const Text('Back')),
                      ),
                      TextButton(onPressed: ()async{
                      bool result= await Get.find<AuthController>().clearAuthData();
                        if(result){
                          Get.offAll(const SplashScreen());
                        }
                      }, child: const Text('OK')),
                    ],
                  );
                });
          },
          icons: Icons.person_outline_rounded,
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIcons(
          onTap: () {},
          icons: Icons.call_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIcons(
          onTap: () {},
          icons: Icons.notifications_active_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
