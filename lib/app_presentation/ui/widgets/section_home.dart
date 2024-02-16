import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({
    super.key, required this.title, required this.onTapSeeAll,
  });
 final String title;
 final VoidCallback onTapSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: const Text('SeeAll',
            style: TextStyle(color: Colors.blueAccent),
          ),
        )
      ],
    );
  }
}
