import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/widgets/custom_text_button.dart';

class ActionButtons extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final int totalPages;

  const ActionButtons({
    super.key,
    required this.controller,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == totalPages - 1;
    final bool isFirstPage = currentPage == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: !isFirstPage,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomTextButton(
            text: "Previous Page",
            onPressed: () => controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
        Visibility(
          visible: !isLastPage,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomTextButton(
            text: "Next Page",
            onPressed: () => controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ],
    );
  }
}
