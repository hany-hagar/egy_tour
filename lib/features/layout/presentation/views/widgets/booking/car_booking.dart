import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:readmore/readmore.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/tour_details_screen.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/review_item.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250.0,
                pinned: true,
                leading: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    NavigatorMethods.pop(context: context);
                    cubit.selectedStars = 0;
                    cubit.comment.clear();
                  },
                  child: Icon(
                    IconBroken.Arrow___Left_2,
                    size: 30.sp,
                    color: Colors.red,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () => cubit.setFavItem(car),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: EdgeInsetsDirectional.only(top: 0, end: 16),
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        cubit.setFavIcon(car),
                        size: 24.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(car.imageUrl, fit: BoxFit.cover),
                ),
              ),
              SliverToBoxAdapter(child: CarDetailBody(car: car)),
            ],
          ),
          bottomNavigationBar: BookingBar(car: car),
        );
      },
    );
  }
}

class CarDetailBody extends StatelessWidget {
  final CarModel car;

  const CarDetailBody({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        car.name,
                        style: Styles.textStyle800.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    Text(
                      '${car.price} EGP / day',
                      style: Styles.textStyle800.copyWith(fontSize: 15.sp),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Description
                ReadMoreText(
                  car.description,
                  trimMode: TrimMode.Line,
                  trimLines: 4,
                  colorClickableText: defaultColor,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: '  Show less',
                  moreStyle: TextStyle(fontSize: 12.sp, color: defaultColor),
                ),
                const SizedBox(height: 16),
                // Car Basics
                Text(
                  "Car Basics",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoBox(
                      Icons.battery_charging_full,
                      "Battery Capacity",
                      "75 kWh",
                    ),
                    InfoBox(Icons.event_seat, "Capacity", "5 Seats"),
                    InfoBox(Icons.door_front_door, "Entrance", "4 Doors"),
                  ],
                ),
                SizedBox(height: 16),
                // Car Features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Car Features",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureIcon(Icons.ac_unit),
                    FeatureIcon(Icons.lock),
                    FeatureIcon(Icons.usb),
                    FeatureIcon(Icons.phone_android),
                    FeatureIcon(Icons.headset),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Host',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green[50], // Light green background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/cars_icon.png',
                        ), // Provide fallback
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.description,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '\u{1F3C6} All-Star Host',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.green, size: 14),
                                SizedBox(width: 2),
                                Text(
                                  car.likes.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '•',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '${car.likes} Trips',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '•',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Joined ${car.likes}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Typically responds in 15 minutes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          Icon(Icons.phone, color: Colors.green[700]),
                          SizedBox(height: 16),
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.green[700],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Trip Dates',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.green[700],
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Any time',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add Dates action
                          log('Add Dates tapped');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Add Dates',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.green[700],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Pickup & Return',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.green[700],
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Any time',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add Dates action
                          log('Add Dates tapped');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Add Dates',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.green[700],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Rating Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rating and Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        showBottomSheet(
                          context: context,
                          showDragHandle: true,
                          backgroundColor: Colors.transparent,
                          builder:
                              (context) => DraggableScrollableSheet(
                                initialChildSize: 0.7, // 70% of screen height
                                maxChildSize: 1,
                                minChildSize: 0.5,
                                builder:
                                    (context, scrollController) => ReviewsList(
                                      reviews: cubit.reverseList(car.reviews),
                                      controller: scrollController,
                                    ),
                              ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(color: defaultColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Rating Value
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amberAccent),
                    const SizedBox(width: 4),
                    Text(
                      car.likes.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${car.reviews.length} ratings)',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ListOfHorizontalReviews(reviews: cubit.reverseList(car.reviews)),
          SizedBox(height: 16.h),
          AddReview(model: car),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget InfoBox(IconData icon, String label, String value) {
  return Container(
    width: 100,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.green, size: 28),
        SizedBox(height: 8),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget FeatureIcon(IconData icon) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Icon(icon, color: Colors.green),
  );
}

class BookingBar extends StatelessWidget {
  const BookingBar({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border(top: BorderSide(color: Colors.grey[700]!)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${car.price} EGP',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.addBooking(model: car);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Booking confirmed!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: defaultColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddReview extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final model;
  const AddReview({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate this app',
                style: Styles.textStyle800.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      cubit.setStars(index);
                    },
                    icon: Icon(
                      index < cubit.selectedStars
                          ? Icons.star
                          : Icons.star_border,
                      color:
                          index < cubit.selectedStars
                              ? Colors.orange
                              : Colors.grey,
                      size: 36,
                    ),
                  );
                }),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 150.h,
                child: CustomTextFormField(
                  maxLines: 10,
                  controller: cubit.comment,
                  keyboardType: TextInputType.multiline,
                  isEnablePrefixIcon: false,
                  isEnableSuffixIcon: false,
                  topContentPadding: 16,
                  isLabelText: false,
                  title: 'Write your review here...',
                  borderRadius: 12.r,
                  backgroundColor: Colors.grey.shade100,
                  enableCompleteStyle: true,
                  completeStyle: Styles.textStyle500.copyWith(fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var date = getFormattedDate();
                    if (cubit.selectedStars == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a rating!')),
                      );
                    } else {
                      var review = ReviewModel(
                        id: model.id,
                        userId: cubit.userInfo.id,
                        userName: cubit.userInfo.name,
                        rating: cubit.selectedStars,
                        comment: cubit.comment.text,
                        date: date,
                        userAvatar: cubit.userInfo.image,
                      );
                      model.reviews.add(review);
                      cubit.addReview(
                        model: model,
                        index: model.reviews.length - 1,
                      );
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Review submitted successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    'Write a review',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  DateTime getFormattedDate() {
    final now = DateTime.now();
    return now;
  }
}

class ReviewsList extends StatelessWidget {
  final List<ReviewModel> reviews;
  final ScrollController? controller;
  const ReviewsList({super.key, required this.reviews, this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: EdgeInsets.only(bottom: 16),
          child: ListView.builder(
            controller: controller,
            clipBehavior: Clip.none,
            shrinkWrap: true,
            padding: EdgeInsets.zero, // No padding at all
            itemCount: reviews.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsetsDirectional.only(top: 16, end: 16),
                  child: ReviewItem(review: reviews[index]),
                ),
          ),
        );
      },
    );
  }
}
