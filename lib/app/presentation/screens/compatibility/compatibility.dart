import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/config/assets/app_backgrounds.dart';
import 'package:app_fleet_webpage/config/assets/app_icons.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Compatibility extends StatelessWidget {
  const Compatibility({
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
            AppBackgrounds.compatibility,
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
              Image.asset(
                AppIcons.gnome,
                width: 348,
                height: 348,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 38),
              Text(
                "Specially Designed for",
                style: AppTheme.fontSize(22),
              ),
              Text(
                "GNOME",
                style: AppTheme.fontSize(64).makeExtraBold(),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Finely Tested",
                    style: AppTheme.fontSize(48).makeBold(),
                  ),
                  Text(
                    " on",
                    style: AppTheme.fontSize(48),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.ubuntu,
                    width: 64,
                    height: 64,
                  ),
                  Text(
                    "Ubuntu 22.10",
                    style: AppTheme.fontSize(42),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0, left: 81.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Should work on",
                  style: AppTheme.fontSize(48)
                      .makeExtraBold()
                      .withColor(Colors.white),
                ),
                Text(
                  "other DEs ;)",
                  style:
                      AppTheme.fontSize(48).makeBold().withColor(Colors.white),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppIcons.kde,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Image.asset(
                      AppIcons.cinnamon,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Image.asset(
                      AppIcons.budgie,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 124.0, right: 81.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Works wherever",
                  style:
                      AppTheme.fontSize(48).makeBold().withColor(Colors.white),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "GNOME",
                      style: AppTheme.fontSize(48)
                          .makeExtraBold()
                          .withColor(Colors.white),
                    ),
                    Text(
                      " Works",
                      style: AppTheme.fontSize(48)
                          .makeBold()
                          .withColor(Colors.white),
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
