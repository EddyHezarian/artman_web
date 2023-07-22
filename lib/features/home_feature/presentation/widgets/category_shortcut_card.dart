import 'package:artman_web/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget categoryShortcutCard(Color color, String title, Icon icon) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                spreadRadius: 0.6,
                blurRadius: 1,
                offset: Offset(1, 3),
                color: Color.fromARGB(83, 143, 141, 141))
          ],
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Center(child: icon),
      ),

      Text(title, style: TextStyles.categoryLabel) //Todo test
    ],
  );
}
