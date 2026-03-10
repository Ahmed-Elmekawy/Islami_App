import 'package:flutter/material.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_routes.dart';
import '../../../../core/utils/shared_pref_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateTo();
  }

  void _navigateTo() {
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the widget is still in the tree before navigating
      if (mounted) {
        bool isFirstTime = SharedPrefHelper.getData("onBoarding") ?? true;
        isFirstTime
            ? Navigator.pushReplacementNamed(context, AppRoutes.onBoarding)
            : Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset(
          AppImages.islamiLogo,
          width: context.screenWidth * 0.35,
        ),
      ),
    );
  }
}
