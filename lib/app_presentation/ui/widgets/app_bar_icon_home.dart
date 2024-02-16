import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key, required this.onTap, required this.icons,
  });
 final VoidCallback onTap;
 final IconData icons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: 35,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icons,color: Colors.black,),
        ),
      ),
    );
  }
}