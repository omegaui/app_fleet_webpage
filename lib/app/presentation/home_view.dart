import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/app/presentation/home_state_machine.dart';
import 'package:app_fleet_webpage/app/presentation/screens/advanced/advanced.dart';
import 'package:app_fleet_webpage/app/presentation/screens/compatibility/compatibility.dart';
import 'package:app_fleet_webpage/app/presentation/screens/features/features.dart';
import 'package:app_fleet_webpage/app/presentation/screens/more/more.dart';
import 'package:app_fleet_webpage/app/presentation/screens/overview/overview.dart';
import 'package:app_fleet_webpage/app/presentation/widgets/navbar.dart';
import 'package:app_fleet_webpage/config/assets/app_icons.dart';
import 'package:app_fleet_webpage/config/assets/app_images.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:app_fleet_webpage/constants/unsupported_device_screen.dart';
import 'package:flutter/material.dart';

bool _artworkInitialized = false;

Future<void> _precacheArtworks(
    BuildContext context, VoidCallback rebuild) async {
  final futures = <Future>[];
  futures.add(precacheImage(const AssetImage(AppImages.bugReport), context));
  futures.add(precacheImage(const AssetImage(AppImages.createConfig), context));
  futures.add(precacheImage(const AssetImage(AppImages.discard), context));
  futures
      .add(precacheImage(const AssetImage(AppImages.gamingExample), context));
  futures.add(precacheImage(const AssetImage(AppImages.homeView), context));
  futures.add(precacheImage(const AssetImage(AppImages.info), context));
  futures.add(precacheImage(const AssetImage(AppImages.launcher), context));
  futures.add(precacheImage(const AssetImage(AppImages.mapper), context));
  futures.add(precacheImage(const AssetImage(AppImages.picker), context));
  futures.add(
      precacheImage(const AssetImage(AppImages.storageStructure), context));
  futures.add(precacheImage(const AssetImage(AppImages.updater), context));
  futures
      .add(precacheImage(const AssetImage(AppImages.workspacePaths), context));
  futures.add(precacheImage(const AssetImage(AppIcons.flutter), context));
  futures.add(precacheImage(const AssetImage(AppIcons.terminal), context));
  futures.add(precacheImage(const AssetImage(AppIcons.appIcon64), context));
  futures.add(precacheImage(const AssetImage(AppIcons.budgie), context));
  futures.add(precacheImage(const AssetImage(AppIcons.cinnamon), context));
  futures.add(precacheImage(const AssetImage(AppIcons.github), context));
  futures.add(precacheImage(const AssetImage(AppIcons.gnome), context));
  futures.add(precacheImage(const AssetImage(AppIcons.ubuntu), context));
  futures.add(precacheImage(const AssetImage(AppIcons.kde), context));
  await Future.wait(futures);
  _artworkInitialized = true;
  rebuild();
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeController controller;

  @override
  void initState() {
    controller = HomeController(
      onRebuildRequested: rebuild,
    );
    super.initState();
  }

  void rebuild() {
    setState(() {});
  }

  Widget getScreen(HomeState state) {
    switch (state) {
      case HomeState.overview:
        return Overview(controller: controller);
      case HomeState.features:
        return Features(controller: controller);
      case HomeState.compatibility:
        return Compatibility(controller: controller);
      case HomeState.advanced:
        return Advanced(controller: controller);
      case HomeState.more:
        return More(controller: controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveScale.getScreenType();
    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.tablet:
        return const UnsupportedDeviceScreen();
      case ScreenType.monitor2k:
      case ScreenType.monitor4k:
      case ScreenType.desktop:
        if (!_artworkInitialized) {
          _precacheArtworks(context, rebuild);
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(),
              ),
            ),
          );
        }
        final state = controller.getCurrentState();
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: getScreen(state),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: NavBar(
                  controller: controller,
                ),
              ),
            ],
          ),
        );
    }
  }
}
