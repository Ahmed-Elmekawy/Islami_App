import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_routes.dart';
import 'package:islamy/core/utils/shared_pref_helper.dart';
import '../../view_model/bloc/splash_bloc.dart';
import '../../view_model/bloc/splash_event.dart';
import '../../view_model/bloc/splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplashTimerEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashFinished) {
            final bool isOnBoardingVisited =
                SharedPrefHelper.getData('onBoarding') ?? false;
            if (isOnBoardingVisited) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            } else {
              Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
            }
          }
        },
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
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
        ),
      ),
    );
  }
}
