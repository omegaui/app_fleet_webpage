import 'package:app_fleet_webpage/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({
    super.key,
    required this.subHeading,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  final String subHeading;
  final Widget icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
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
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: hover
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.9),
                      blurRadius: 16,
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Download",
                    style: AppTheme.fontSize(22)
                        .makeBold()
                        .withColor(Colors.white),
                  ),
                  Text(
                    widget.subHeading,
                    style: AppTheme.fontSize(12)
                        .makeBold()
                        .withColor(Colors.white),
                  ),
                ],
              ),
              const SizedBox(width: 7),
              widget.icon,
            ],
          ),
        ),
      ),
    );
  }
}
