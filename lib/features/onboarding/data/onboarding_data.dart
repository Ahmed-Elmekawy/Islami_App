import '../../../core/utils/app_assets.dart';
import 'models/onboarding_model.dart';

const List<OnboardingModel> onBoardingContents = [
  OnboardingModel(title: "Welcome To Islmi App", image: AppImages.welcomeIntro),
  OnboardingModel(
    title: "Welcome To Islami",
    image: AppImages.kabbaIntro,
    desc: "We Are Very Excited To Have You In Our Community",
  ),
  OnboardingModel(
    title: "Reading the Quran",
    image: AppImages.readingIntro,
    desc: "Read, and your Lord is the Most Generous",
  ),
  OnboardingModel(
    title: "Bearish",
    image: AppImages.bearishIntro,
    desc: "Praise the name of your Lord, the Most High",
  ),
  OnboardingModel(
    title: "Holy Quran Radio",
    image: AppImages.radioIntro,
    desc:
        "You can listen to the Holy Quran Radio through the application for free and easily",
  ),
];
