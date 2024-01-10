import 'package:flutter/material.dart';
import 'package:nike/config/colors/app_colors.dart';

class LAnimateIcon extends StatefulWidget {
  final bool isFav;
  final VoidCallback onPressed;
  final AnimatedIconData icon1;
  final AnimatedIconData icon2;

  const LAnimateIcon(
      {Key? key,
      required this.isFav,
      required this.onPressed,
      required this.icon1,
      required this.icon2})
      : super(key: key);

  @override
  State<LAnimateIcon> createState() => _LAnimateIconState();
}

class _LAnimateIconState extends State<LAnimateIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IconButton(
        iconSize: 50,
        tooltip: 'fav',
        icon: AnimatedIcon(
          icon: widget.isFav ? (widget.icon1) : (widget.icon2),
          progress: _animationController,
          color: widget.isFav ? Colors.red : const Color(AppColors.kGreyColor),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Set the initial state based on the provided 'isFav' value
    if (widget.isFav) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
