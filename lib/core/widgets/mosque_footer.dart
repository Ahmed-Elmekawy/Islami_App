import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class MosqueFooter extends StatelessWidget {
  const MosqueFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.mosque,
      height: 70,
      width: double.infinity,
      fit: BoxFit.fitWidth,
      opacity: const AlwaysStoppedAnimation(0.3),
    );
  }
}
