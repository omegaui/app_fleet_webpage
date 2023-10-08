import 'package:app_fleet_webpage/config/assets/app_animations.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnsupportedDeviceScreen extends StatelessWidget {
  const UnsupportedDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                AppAnimations.desktop,
              ),
              Text(
                "Hey, This web page needs a bigger screen to display contents.",
                textAlign: TextAlign.center,
                style: AppTheme.fontSizeScaled(32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
