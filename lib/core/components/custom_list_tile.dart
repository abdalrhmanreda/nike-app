import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData leadingIcon;
  final String title;

  const CustomListTile({
    Key? key,
    required this.onTap,
    required this.leadingIcon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon),
      title: Text(title),
    );
  }
}
