import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/app/presentation/screens/features/features.dart';
import 'package:app_fleet_webpage/app/presentation/screens/overview/widgets/download_button.dart';
import 'package:app_fleet_webpage/config/assets/app_backgrounds.dart';
import 'package:app_fleet_webpage/config/assets/app_icons.dart';
import 'package:app_fleet_webpage/config/assets/app_images.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Overview extends StatelessWidget {
  const Overview({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    if (!cacheDone) {
      for (var image in features.values) {
        precacheImage(image, context);
      }
      cacheDone = true;
    }
    final size = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            AppBackgrounds.overview,
            width: size,
            height: 622,
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Meet App Fleet",
                style: AppTheme.fontSize(64),
              ),
              Text(
                "A Workspace Launch Automation Tool",
                style: AppTheme.fontSize(32),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 750,
                height: 600,
                child: Stack(
                  children: [
                    Align(
                      child: Image.asset(
                        AppImages.createConfig,
                        width: 750,
                        height: 600,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.4),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          AppIcons.appIcon64,
                          width: 48,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 125),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(43.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DownloadButton(
                  subHeading: 'from releases',
                  icon: SvgPicture.asset(
                    AppIcons.github,
                    width: 32,
                  ),
                  onPressed: () {
                    controller.downloadFromReleases();
                  },
                  color: const Color(0xFF262626),
                ),
                const SizedBox(height: 10),
                DownloadButton(
                  subHeading: 'using your shell',
                  icon: SvgPicture.asset(
                    AppIcons.terminal,
                    width: 32,
                  ),
                  onPressed: () {
                    controller.downloadUsingShell();
                  },
                  color: const Color(0xFF0C79F9),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
