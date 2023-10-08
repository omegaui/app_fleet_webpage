import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WorkspaceCarousel extends StatefulWidget {
  const WorkspaceCarousel({
    super.key,
    required this.carouselTexts,
    required this.carouselImages,
  });

  final List<String> carouselTexts;
  final List<AssetImage> carouselImages;

  @override
  State<WorkspaceCarousel> createState() => _WorkspaceCarouselState();
}

class _WorkspaceCarouselState extends State<WorkspaceCarousel> {
  int currentView = 0;

  void rebuild(int index) {
    if (index == currentView) {
      return;
    }
    setState(() {
      currentView = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        int index = 0;
        while (index >= 0) {
          await Future.delayed(const Duration(seconds: 10));
          index++;
          if (index == widget.carouselTexts.length) {
            index = 0;
          }
          if (mounted) {
            setState(() {
              currentView = index;
            });
          } else {
            break;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 550),
          child: Column(
            key: ValueKey("$currentView"),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.carouselTexts[currentView],
                style: AppTheme.fontSize(36).makeBold(),
              ).animate().shimmer(
                  delay: const Duration(milliseconds: 750),
                  duration: const Duration(seconds: 1)),
              Image(
                image: widget.carouselImages[currentView],
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 18),
            ],
          ),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        ),
        Wrap(
          spacing: 11,
          children: List.generate(widget.carouselTexts.length, (index) {
            return CarouselButton(
              selected: currentView == index,
              value: index,
              onSelected: (index) => rebuild(index),
            );
          }),
        ),
      ],
    );
  }
}

class CarouselButton extends StatefulWidget {
  const CarouselButton({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.value,
  });

  final bool selected;
  final int value;
  final void Function(int index) onSelected;

  @override
  State<CarouselButton> createState() => _CarouselButtonState();
}

class _CarouselButtonState extends State<CarouselButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onSelected(widget.value),
      child: MouseRegion(
        onEnter: (e) => setState(() => hover = true),
        onExit: (e) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: hover
                ? Colors.pink
                : widget.selected
                    ? const Color(0xFFF14742)
                    : const Color(0xFF969696).withOpacity(0.40),
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: widget.selected
                ? Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
