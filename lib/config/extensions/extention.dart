import 'package:flutter/material.dart';

extension SizedBoxExtention on double {
  SizedBox get sizedBoxheightExtention => SizedBox(
        height: toDouble(),
      );
  SizedBox get sizedBoxWidthExtension => SizedBox(
        width: toDouble(),
      );
}
