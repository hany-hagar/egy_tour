import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/explore.dart';

class CustomSearch extends StatelessWidget {
  final String searchBarText;
  final void Function()? onTap;
  const CustomSearch({super.key, required this.searchBarText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => NavigatorMethods.push(context: context, nextPage: Explore()),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    searchBarText,
                    style: Styles.textStyle500.copyWith(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Icon(IconBroken.Search, size: 18, color: Colors.black87), 
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
