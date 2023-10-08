import 'package:app_fleet_webpage/app/presentation/home_state_machine.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeController {
  HomeState _currentState = HomeState.overview;
  HomeEvent _currentEvent = HomeEvent.overview;
  final VoidCallback _onRebuildRequested;

  HomeController({required VoidCallback onRebuildRequested})
      : _onRebuildRequested = onRebuildRequested;

  HomeState getCurrentState() => _currentState;

  void onEvent(HomeEvent event) {
    if (_currentEvent == event) {
      return;
    }
    switch (event) {
      case HomeEvent.overview:
        _currentState = HomeState.overview;
        break;
      case HomeEvent.features:
        _currentState = HomeState.features;
        break;
      case HomeEvent.compatibility:
        _currentState = HomeState.compatibility;
        break;
      case HomeEvent.advanced:
        _currentState = HomeState.advanced;
        break;
      case HomeEvent.more:
        _currentState = HomeState.more;
    }
    _currentEvent = event;
    _onRebuildRequested();
  }

  void downloadFromReleases() {
    launchUrlString('https://github.com/omegaui/app-fleet/releases/latest');
  }

  void downloadUsingShell() {
    launchUrlString(
        'https://github.com/omegaui/app_fleet#install-using-your-shell');
  }
}
