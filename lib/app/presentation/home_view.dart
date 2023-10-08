import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/app/presentation/home_state_machine.dart';
import 'package:app_fleet_webpage/app/presentation/screens/advanced/advanced.dart';
import 'package:app_fleet_webpage/app/presentation/screens/compatibility/compatibility.dart';
import 'package:app_fleet_webpage/app/presentation/screens/features/features.dart';
import 'package:app_fleet_webpage/app/presentation/screens/more/more.dart';
import 'package:app_fleet_webpage/app/presentation/screens/overview/overview.dart';
import 'package:app_fleet_webpage/app/presentation/widgets/navbar.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:app_fleet_webpage/constants/unsupported_device_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      onRebuildRequested: () {
        setState(() {});
      },
    );
    super.initState();
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
        final state = controller.getCurrentState();
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
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
