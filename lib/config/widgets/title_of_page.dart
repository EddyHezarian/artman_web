import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class TitleOfPage extends StatelessWidget {
    const TitleOfPage({
    required this.title,
    super.key,
  });
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
           title,
            style: TextStyles.titleOfPage,
          )),
    );
  }
}
