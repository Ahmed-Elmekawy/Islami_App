import 'package:flutter/material.dart';
import '../extensions/media_query_extension.dart';
import '../utils/app_assets.dart';

class MosqueHeader extends StatelessWidget {
  const MosqueHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.mosqueHeader,
      height: context.screenHeight * 0.2,
      width: context.screenWidth * 0.7,
      fit: BoxFit.contain,
    );
  }
}
