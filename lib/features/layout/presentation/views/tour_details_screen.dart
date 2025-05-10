import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:readmore/readmore.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/call_button.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/review_item.dart';

class TourDetailsScreen extends StatelessWidget {
  const TourDetailsScreen({super.key, required this.tour});
  final TourModel tour;

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
                    onTap: () => cubit.setFavItem(tour),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: EdgeInsetsDirectional.only(top: 0, end: 16),
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        cubit.setFavIcon(tour),
                        size: 24.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(tour.imageUrl, fit: BoxFit.cover),
                ),
              ),
              SliverToBoxAdapter(child: TourDetailsBody(tour: tour)),
            ],
          ),
          bottomNavigationBar: BookingBar(tour: tour),
        );
      },
    );
  }
}

class TourDetailsBody extends StatelessWidget {
  const TourDetailsBody({super.key, required this.tour});

  final TourModel tour;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          tour.name,
                          style: Styles.textStyle800.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      Text(
                        '${tour.price} EGP',
                        style: Styles.textStyle800.copyWith(fontSize: 15.sp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Description
                  ReadMoreText(
                    tour.description,
                    trimMode: TrimMode.Line,
                    trimLines: 4,
                    colorClickableText: defaultColor,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: '  Show less',
                    moreStyle: TextStyle(fontSize: 12.sp, color: defaultColor),
                  ),
                  const SizedBox(height: 16),

                  // Package Info
                  Text(
                    'Package Details',
                    style: Styles.textStyle800.copyWith(fontSize: 20.sp),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.schedule, color: defaultColor),
                      const SizedBox(width: 8),
                      Text('${tour.days} Days'),
                      const SizedBox(width: 16),
                      Icon(Icons.people, color: defaultColor),
                      const SizedBox(width: 8),
                      Text('${tour.people} People'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Host Info
                  Text(
                    'Host',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/images/carRentAuthor.png',
                          ),
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tour.hostName,
                                style: Styles.textStyle800.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Phone: ${tour.phone}',
                                style: Styles.textStyle800.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                'Location: ${tour.location}',
                                style: Styles.textStyle800.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CallButton(
                          phoneNumber: tour.phone,
                          icon: Icons.call,
                          iconColor: Colors.white,
                          iconSize: 24.sp,
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
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
                                      (context, scrollController) =>
                                          ReviewsList(
                                            reviews: cubit.reverseList(
                                              tour.reviews,
                                            ),
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
                        tour.rating.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '(${tour.reviews.length} ratings)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Reviews
            ListOfHorizontalReviews(reviews: cubit.reverseList(tour.reviews)),
            SizedBox(height: 16.h),
            AddReview(model: tour),
          ],
        );
      },
    );
  }
}

class ListOfHorizontalReviews extends StatelessWidget {
  const ListOfHorizontalReviews({super.key, required this.reviews});

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: GridView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.6,
              ),
              padding: EdgeInsets.zero, // No padding at all
              itemCount: reviews.length,
              itemBuilder:
                  (context, index) => ReviewItem(review: reviews[index]),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class BookingBar extends StatelessWidget {
  const BookingBar({super.key, required this.tour});

  final TourModel tour;

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
              '${tour.price} EGP',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.addBooking(model: tour);
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
