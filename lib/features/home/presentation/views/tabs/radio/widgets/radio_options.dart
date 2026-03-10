import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_colors.dart';

class RadioOptions extends StatelessWidget {
  final bool isRadioSelected;
  final Function(bool) onOptionChanged;

  const RadioOptions({
    super.key,
    required this.isRadioSelected,
    required this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _radioOptionItem(
              context,
              "Radio",
              isRadioSelected,
              () => onOptionChanged(true),
            ),
          ),
          Expanded(
            child: _radioOptionItem(
              context,
              "Reciters",
              !isRadioSelected,
              () => onOptionChanged(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _radioOptionItem(
    BuildContext context,
    String text,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isSelected ? AppColors.secondary : AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
