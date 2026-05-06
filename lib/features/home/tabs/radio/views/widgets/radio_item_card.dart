import 'package:flutter/material.dart';

class RadioItemCard extends StatelessWidget {
  final String title;
  final bool isPlaying;
  final VoidCallback onPlayToggle;

  const RadioItemCard({
    super.key,
    required this.title,
    required this.isPlaying,
    required this.onPlayToggle,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE2BE7F);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        trailing: InkWell(
          onTap: onPlayToggle,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
              key: ValueKey<bool>(isPlaying),
              size: 48,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}



