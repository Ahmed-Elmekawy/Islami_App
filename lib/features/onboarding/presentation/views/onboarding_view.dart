import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/features/onboarding/data/onboarding_data.dart';
import 'package:islamy/features/onboarding/presentation/views/widgets/onboarding_buttons.dart';
import 'package:islamy/features/onboarding/presentation/views/widgets/on_boarding_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) => setState(() {
                    _currentPage = value;
                  }),
                  itemCount: onBoardingContents.length,
                  itemBuilder: (context, index) => OnBoardingItem(
                    onboardingModel: onBoardingContents[index],
                  ),
                ),
              ),
              OnBoardingButtons(controller: _controller, currentPage: _currentPage),
              const SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
