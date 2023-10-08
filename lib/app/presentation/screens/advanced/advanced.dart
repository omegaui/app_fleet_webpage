import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/config/assets/app_backgrounds.dart';
import 'package:app_fleet_webpage/config/assets/app_icons.dart';
import 'package:app_fleet_webpage/config/assets/app_images.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Advanced extends StatelessWidget {
  const Advanced({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            AppBackgrounds.advanced,
            width: width,
            height: 531,
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(height: 100),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.storageStructure,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      AppImages.workspacePaths,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      AppImages.gamingExample,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 44.0, bottom: 158.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "From",
                      style: AppTheme.fontSize(48).withColor(Colors.white),
                    ),
                    Text(
                      " App Settings",
                      style: AppTheme.fontSize(48)
                          .makeBold()
                          .withColor(Colors.white),
                    ),
                    Text(
                      " to",
                      style: AppTheme.fontSize(48).withColor(Colors.white),
                    ),
                    Text(
                      " Workspace Configurations,",
                      style: AppTheme.fontSize(48)
                          .makeBold()
                          .withColor(Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "everything is totally",
                      style: AppTheme.fontSize(48).withColor(Colors.white),
                    ),
                    Text(
                      " customizable",
                      style: AppTheme.fontSize(48)
                          .makeExtraBold()
                          .withColor(Colors.white),
                    ),
                    Text(
                      " without even using the UI.",
                      style: AppTheme.fontSize(48).withColor(Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
