
/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/core/utils/styles.dart';
import 'package:tour_app/features/layout/data/models/notification_model.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
    required this.message,
    required this.notification,
  });
  final Map<String, dynamic> message;
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 10.sp),
            padding: EdgeInsetsDirectional.only(
              start: 5.sp,
              end: 10.sp,
              top: 5.sp,
              bottom: 5.sp,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.sp),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(notification.image),
                  radius: 20.sp,
                ),
                SizedBox(width: 10.sp),
                Text(
                  notification.name.toUpperCase(),
                  style: Styles.textStyle600.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
