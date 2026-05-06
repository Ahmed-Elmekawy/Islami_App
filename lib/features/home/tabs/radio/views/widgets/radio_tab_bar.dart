import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/bloc/radio_bloc.dart';
import '../../view_model/bloc/radio_event.dart';

class RadioTabBar extends StatelessWidget {
  final bool isRadioSelected;

  const RadioTabBar({super.key, required this.isRadioSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TabItem(
          label: 'Radios',
          isSelected: isRadioSelected,
          onTap: () =>
              context.read<RadioBloc>().add(const ToggleTabEvent(true)),
        ),
        _TabItem(
          label: 'Reciters',
          isSelected: !isRadioSelected,
          onTap: () =>
              context.read<RadioBloc>().add(const ToggleTabEvent(false)),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE2BE7F);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
