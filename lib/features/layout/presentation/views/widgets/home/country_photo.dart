import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/styles.dart';

class CountryPhoto extends StatelessWidget {
  final String image;
  final String name;
  final void Function()? iconOnPressed;
  const CountryPhoto({
    super.key,
    required this.image,
    required this.name,
    this.iconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.27,
          child: Image.network(image, fit: BoxFit.fill),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning,",
                        style: Styles.textStyle800.copyWith(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                        
                      ),
                      Text(
                        "$name 👋",
                        style: Styles.textStyle800.copyWith(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                        
                      ),
                      Text(
                        "Let's explore today",
                        style: Styles.textStyle500.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 14.sp,
                          height: 2
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: iconOnPressed,
                  icon: Icon(
                    IconBroken.Heart,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
