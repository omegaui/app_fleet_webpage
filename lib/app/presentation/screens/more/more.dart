import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/app/presentation/screens/more/widgets/link_text.dart';
import 'package:app_fleet_webpage/config/assets/app_backgrounds.dart';
import 'package:app_fleet_webpage/config/assets/app_icons.dart';
import 'package:app_fleet_webpage/config/assets/app_images.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final links = {
  "Advanced Installation Options":
      "https://github.com/omegaui/app_fleet#install-advanced-installation-options",
  "Advanced Configuration Options":
      "https://github.com/omegaui/app_fleet#advanced-configuration-options",
  "GitHub Repository": "https://github.com/omegaui/app_fleet",
  "Quick Task Launcher":
      "https://github.com/omegaui/app_fleet#quick-task-launcher",
  "Web Page’s Source": "https://github.com/omegaui/app_fleet_webpage",
  "My GitHub Profile": "https://github.com/omegaui",
  "Project's README":
      "https://github.com/omegaui/app_fleet/blob/main/README.md",
};

final moreLinks = {};

class More extends StatelessWidget {
  const More({
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 196.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "#OpenSourceRules",
                  style: AppTheme.fontSize(64).makeBold(),
                ),
                Image.asset(
                  AppImages.info,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: width,
            height: 395,
            child: Stack(
              children: [
                Align(
                  child: SvgPicture.asset(
                    AppBackgrounds.more,
                    width: width,
                    height: 395,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Align(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 31.0, bottom: 31.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.flutter,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                  const SizedBox(width: 43.0),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Powered by",
                                        style: AppTheme.fontSize(40)
                                            .withColor(Colors.white),
                                      ),
                                      Text(
                                        "The Flutter Framework",
                                        style: AppTheme.fontSize(40)
                                            .makeBold()
                                            .withColor(Colors.white),
                                      ),
                                      Text(
                                        "& The Open Source ecosystem",
                                        style: AppTheme.fontSize(40)
                                            .makeMedium()
                                            .withColor(Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: VerticalDivider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            direction: Axis.vertical,
                            children: links.entries
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(
                                        left: 50.0,
                                        top: 20.0,
                                      ),
                                      child:
                                          LinkText(text: e.key, url: e.value),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Made with ♥️ by @omegaui",
              style: AppTheme.fontSize(20).makeMedium().withColor(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
