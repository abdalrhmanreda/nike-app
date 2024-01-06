import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/config/colors/app_colors.dart';

class HorizontalChoiceList extends StatefulWidget {
  final List<String> options;

  const HorizontalChoiceList({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  _HorizontalChoiceListState createState() => _HorizontalChoiceListState();
}

class _HorizontalChoiceListState extends State<HorizontalChoiceList> {
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.options
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = entry.key;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 40.h,
                  width: 100,
                  decoration: BoxDecoration(
                    color: selectedOptionIndex == entry.key
                        ? const Color(AppColors.kSplashColor)
                        : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: selectedOptionIndex == entry.key
                          ? Colors.white
                          : Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
