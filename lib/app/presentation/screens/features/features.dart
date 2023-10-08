import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/app/presentation/screens/features/widgets/workspace_carousel.dart';
import 'package:app_fleet_webpage/config/assets/app_backgrounds.dart';
import 'package:app_fleet_webpage/config/assets/app_icons.dart';
import 'package:app_fleet_webpage/config/assets/app_images.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Map<String, AssetImage> features = {
  'Organize your Workspaces Effortlessly': const AssetImage(AppImages.homeView),
  'Pick any of your installed Apps': const AssetImage(AppImages.picker),
  'Even Map Apps to Specific Workspaces': const AssetImage(AppImages.mapper),
  'Automatic Bug Report Generation': const AssetImage(AppImages.bugReport),
  'In App Update Notifier': const AssetImage(AppImages.updater),
  'Startup Workspace Launcher': const AssetImage(AppImages.launcher),
  'Top Notch User Experience': const AssetImage(AppImages.discard),
};
bool cacheDone = false;

class Features extends StatelessWidget {
  const Features({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppBackgrounds.features,
            width: size,
            height: 740,
            fit: BoxFit.fitWidth,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: WorkspaceCarousel(
            carouselTexts: features.keys.toList(),
            carouselImages: features.values.toList(),
          ),
        ),
      ],
    );
  }
}
