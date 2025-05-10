// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/styles.dart';

class TicketForPlacesDetails extends StatelessWidget {
  final String image;
  final String intro;
  final String description;
  final int likes;
  final String title;
  final String whatexpect;

  const TicketForPlacesDetails({
    super.key,
    required this.image,
    required this.intro,
    required this.description,
    required this.likes,
    required this.title,
    required this.whatexpect,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.black,
                size: 20.sp,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  IconBroken.Heart,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 600.sp,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, color: Colors.red, size: 50.sp),
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Gradient Overlay
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Title & Intro
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 16.w,
              right: 16.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < likes ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 20.sp,
                      );
                    }),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.5))
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    intro,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.5))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Draggable Scrollable Sheet
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.7,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        labelStyle: Styles.textStyle18,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.teal,
                        indicatorWeight: 3.0,
                        tabs: const [
                          Tab(text: 'Overview'),
                          Tab(text: 'Photo'),
                          Tab(text: 'Reviews'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              controller: scrollController,
                              child: _buildOverviewTab(context),
                            ),
                            Center(child: Text('Photo Tab Content')),
                            Center(child: Text('Reviews Tab Content')),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: _buildBookingBar(context),
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.pinkAccent, size: 20.sp),
              SizedBox(width: 8.w),
              Text('8 hours', style: TextStyle(fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.language, color: Colors.pinkAccent, size: 20.sp),
              SizedBox(width: 8.w),
              Text('Offered in: English', style: TextStyle(fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            description,
            style: TextStyle(
                fontSize: 14.sp, color: Colors.black87, height: 1.4),
          ),
          SizedBox(height: 12.h),
          Text(
            'What to Expect:',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            whatexpect,
            style: TextStyle(
                fontSize: 14.sp, color: Colors.black87, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingBar(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$50',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'per person',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(width: 30.h),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking Initiated! (Placeholder)')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                elevation: 3,
              ),
              child: Text(
                'Book now',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}