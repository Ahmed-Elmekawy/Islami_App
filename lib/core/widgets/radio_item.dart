import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';

class RadioItem extends StatelessWidget {
  final String name;
  final bool isPlaying;
  final bool isMuted;
  final VoidCallback onPlayPressed;
  final VoidCallback onMutePressed;

  const RadioItem({
    super.key,
    required this.isPlaying,
    required this.isMuted,
    required this.onPlayPressed,
    required this.onMutePressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(isPlaying ? AppImages.soundWave : AppImages.mosque),
          fit: BoxFit.fitWidth,
          opacity: 0.3,
          alignment: Alignment.bottomCenter,
        ),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              textAlign: TextAlign.center,
              name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.secondary),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onPlayPressed,
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 40,
                  color: AppColors.secondary,
                ),
              ),
              IconButton(
                onPressed: onMutePressed,
                icon: Icon(
                  isMuted ? Icons.volume_off : Icons.volume_up,
                  size: 30,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
