import 'package:ecommerce_project/app_presentation/ui/utilities/assets_path.dart';
import 'package:flutter/cupertino.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key, this.height, this.width,
  });
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logoPath,height: height ?? 100 ,width: width,);
  }
}