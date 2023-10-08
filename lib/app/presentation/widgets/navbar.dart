import 'package:app_fleet_webpage/app/presentation/home_controller.dart';
import 'package:app_fleet_webpage/app/presentation/home_state_machine.dart';
import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavButton(
            text: "Overview",
            onPressed: () {
              widget.controller.onEvent(HomeEvent.overview);
            },
            selected: widget.controller.getCurrentState() == HomeState.overview,
          ),
          const SizedBox(width: 12),
          NavButton(
            text: "Features",
            onPressed: () {
              widget.controller.onEvent(HomeEvent.features);
            },
            selected: widget.controller.getCurrentState() == HomeState.features,
          ),
          const SizedBox(width: 12),
          NavButton(
            text: "Compatibility",
            onPressed: () {
              widget.controller.onEvent(HomeEvent.compatibility);
            },
            selected:
                widget.controller.getCurrentState() == HomeState.compatibility,
          ),
          const SizedBox(width: 12),
          NavButton(
            text: "Advanced Usage",
            onPressed: () {
              widget.controller.onEvent(HomeEvent.advanced);
            },
            selected: widget.controller.getCurrentState() == HomeState.advanced,
          ),
          const SizedBox(width: 12),
          NavButton(
            text: "More",
            onPressed: () {
              widget.controller.onEvent(HomeEvent.more);
            },
            selected: widget.controller.getCurrentState() == HomeState.more,
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  const NavButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.selected,
  });

  final String text;
  final bool selected;
  final VoidCallback onPressed;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (e) => setState(() => hover = true),
        onExit: (e) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 30,
          decoration: BoxDecoration(
            color: widget.selected
                ? const Color(0xFF0C79F9)
                : const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: hover ? const Color(0xFF0C79F9) : Colors.transparent),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 6,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: AppTheme.fontSize(14).makeMedium().withColor(
                  widget.selected
                      ? Colors.white
                      : Colors.black.withOpacity(0.7)),
            ),
          ),
        ),
      ),
    );
  }
}
