import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  LayoutAppBar({
    super.key,
    this.advancedDrawerController,
    required this.title,
    this.leading,
    this.actions,
    this.onTap,
    this.color,
  });
  AdvancedDrawerController? advancedDrawerController;
  final String title;
  Widget? leading;
  List<Widget>? actions;
  VoidCallback? onTap;
  int? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(color!),
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      leading: IconButton(
        icon: leading!,
        onPressed: () {
          onTap?.call();
        },
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
