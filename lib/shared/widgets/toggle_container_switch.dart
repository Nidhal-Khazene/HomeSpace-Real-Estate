import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';

class ToggleContainerSwitch extends StatefulWidget {
  const ToggleContainerSwitch({super.key});

  @override
  State<ToggleContainerSwitch> createState() => _ToggleContainerSwitchState();
}

class _ToggleContainerSwitchState extends State<ToggleContainerSwitch> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
        width: 40,
        height: 24,
        decoration: ShapeDecoration(
          color: isActive ? ColorsData.kLightPrimaryColor : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isActive
                  ? ColorsData.kMediumPrimaryColor
                  : ColorsData.kBorderColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Stack(
          children: [
            isActive
                ? const Positioned(left: 17, top: 1, child: ActiveCircle())
                : const Positioned(left: 2, top: 1, child: InActiveCircle()),
          ],
        ),
      ),
    );
  }
}

class ActiveCircle extends StatelessWidget {
  const ActiveCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: ShapeDecoration(
        color: ColorsData.kMediumPrimaryColor,
        shape: const OvalBorder(),
      ),
    );
  }
}

class InActiveCircle extends StatelessWidget {
  const InActiveCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const ShapeDecoration(
        color: Color(0xFF8C8B8B),
        shape: OvalBorder(),
      ),
    );
  }
}
