import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:intl/intl.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/hive_hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/review_item.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';

class HotelBooking extends StatefulWidget {
  final HotelModel model;

  const HotelBooking({super.key, required this.model});

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _dragExtent = 0.5;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.black,
                  size: 25.sp,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => cubit.setFavItem(widget.model),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    cubit.setFavIcon(widget.model),
                    size: 25.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              // Background Image with movement
              AnimatedBuilder(
                animation: Listenable.merge([_tabController]),
                builder: (context, _) {
                  return Positioned(
                    top:
                        -MediaQuery.of(context).size.height *
                        0.5 *
                        (_dragExtent - 0.2),
                    left: 0,
                    right: 0,
                    height: 600.sp,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(
                        widget.model.roomImages.first,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 50.sp,
                              ),
                            ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value:
                                  loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),

              // Gradient Overlay
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black45],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              // Title & Intro with moving effect
              Positioned(
                top:
                    MediaQuery.of(context).size.height * 0.1 -
                    (_dragExtent - 0.9) * 100,
                left: 16.w,
                right: 16.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < widget.model.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 20.sp,
                        );
                      }),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.model.name,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 2.0, color: Colors.black)],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          widget.model.address,
                          style: Styles.textStyle800.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Draggable Scrollable Sheet
              NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  setState(() {
                    _dragExtent = notification.extent;
                  });
                  return true;
                },
                child: DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 0.7,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent,
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
                            controller: _tabController,
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
                              controller: _tabController,
                              children: [
                                SingleChildScrollView(
                                  controller: scrollController,
                                  child: OverViewBody(model: widget.model),
                                ),
                                SingleChildScrollView(
                                  controller: scrollController,
                                  child: PhotosBody(
                                    images: widget.model.roomImages,
                                  ),
                                ),
                                SingleChildScrollView(
                                  controller: scrollController,
                                  child: ReviewsBody(model: widget.model),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BookingBar(
            context: context,
            model: widget.model,
          ),
        );
      },
    );
  }
}

class BookingBar extends StatelessWidget {
  final HotelModel model;
  const BookingBar({super.key, required this.context, required this.model});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
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
                    '\$${model.pricePerNight.toInt().toString()} EGP',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'per room per night',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
              SizedBox(width: 30.h),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (_) => HotelBookingSheet(model: model),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Booking Initiated! (Placeholder)'),
                      ),
                    );
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
                    'Book now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String extractPriceAndCurrency(String input) {
    final RegExp regExp = RegExp(r'^([\d.]+)\s([A-Z]+)');
    final match = regExp.firstMatch(input);

    if (match != null) {
      final price = match.group(1);
      final currency = match.group(2);
      return '$price $currency';
    } else {
      return 'Invalid format';
    }
  }
}

class ReviewsBody extends StatelessWidget {
  final HotelModel model;
  const ReviewsBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: model.reviews.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(end: 16, bottom: 16),
              child: ReviewItem(review: model.reviews[index]),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RateAppWidget(model: model),
        ),
      ],
    );
  }
}

class PhotosBody extends StatelessWidget {
  final List<String> images;
  const PhotosBody({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -0.h),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        addAutomaticKeepAlives: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 3 items per row
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.9, // Adjust for square items
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: NetworkImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class RateAppWidget extends StatefulWidget {
  final HotelModel model;

  const RateAppWidget({super.key, required this.model});

  @override
  // ignore: library_private_types_in_public_api
  _RateAppWidgetState createState() => _RateAppWidgetState();
}

class _RateAppWidgetState extends State<RateAppWidget> {
  int selectedStars = 0;
  var comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Column(
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
                setState(() {
                  selectedStars = index + 1;
                });
              },
              icon: Icon(
                index < selectedStars ? Icons.star : Icons.star_border,
                color: index < selectedStars ? Colors.orange : Colors.grey,
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
            controller: comment,
            keyboardType: TextInputType.multiline,
            isEnablePrefixIcon: false,
            isEnableSuffixIcon: false,
            topContentPadding: 16,
            isLabelText: false,
            title: 'Write your review here...',
            borderRadius: 12.r,
            borderColor: Colors.grey.shade300,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              var date = getFormattedDate();
              if (selectedStars == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select a rating!')),
                );
              } else {
                var review = ReviewModel(
                  id: widget.model.id,
                  userId: cubit.userInfo.id,
                  userName: cubit.userInfo.name,
                  rating: selectedStars,
                  comment: comment.text,
                  date: date,
                  userAvatar: cubit.userInfo.image,
                );
                widget.model.reviews.add(review);
                var data = HiveHotelModel(
                  reviewIndex: widget.model.reviews.length - 1,
                  model: widget.model,
                );
                cubit.hotelsReviews.add(data);
                comment.clear();
                selectedStars = 0;
                setState(() {});
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
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
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
    );
  }

  DateTime getFormattedDate() {
    final now = DateTime.now();
    return now;
  }
}

class OverViewBody extends StatelessWidget {
  final HotelModel model;
  const OverViewBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.location_on, size: 18.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  model.address,
                  style: Styles.textStyle800.copyWith(fontSize: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.star, size: 18.sp, color: Colors.amber),
              SizedBox(width: 4.w),
              Text(
                '${model.rating} (${model.reviewCount})',
                style: Styles.textStyle800.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.attach_money, size: 18.sp, color: Colors.green),
              SizedBox(width: 4.w),
              Text(
                'From \$${model.pricePerNight}/night',
                style: Styles.textStyle800.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: 16.w),
              Icon(Icons.hotel, size: 18.sp, color: Colors.blue),
              SizedBox(width: 4.w),
              Text(
                model.roomType,
                style: Styles.textStyle800.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Hotel Description
          Text(
            'About the Hotel',
            style: Styles.textStyle800.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            model.description,
            style: Styles.textStyle800.copyWith(fontSize: 14.sp),
            maxLines: 10,
          ),
          SizedBox(height: 16.h),

          // Amenities Section
          Text(
            'Amenities',
            style: Styles.textStyle800.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 4.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 0.h,
            children:
                model.amenities
                    .map(
                      (amenity) => Chip(
                        label: Text(
                          amenity,
                          style: Styles.textStyle800.copyWith(fontSize: 12.sp),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    )
                    .toList(),
          ),
          SizedBox(height: 16.h),
          Text(
            'Hotel Policies',
            style: Styles.textStyle800.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          ...model.policies.map(
            (policy) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 8.sp, color: Colors.grey),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      policy,
                      style: Styles.textStyle800.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class HotelBookingSheet extends StatefulWidget {
  final HotelModel model;
  const HotelBookingSheet({super.key, required this.model});

  @override
  State<HotelBookingSheet> createState() => _HotelBookingSheetState();
}

class _HotelBookingSheetState extends State<HotelBookingSheet> {
  DateTime? startDate;
  DateTime? endDate;
  final double pricePerDay = 100.0;

  final dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> pickDate({required bool isStart}) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? (startDate ?? now) : (endDate ?? now),
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
          if (endDate != null && endDate!.isBefore(startDate!)) {
            endDate = null; // reset if end is before start
          }
        } else {
          endDate = picked;
        }
      });
    }
  }

  int getDaysDifference() {
    if (startDate != null && endDate != null) {
      return endDate!.difference(startDate!).inDays;
    }
    return 0;
  }

  double getTotalPrice() {
    return getDaysDifference() * pricePerDay;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Book Your Hotel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 16),
          // Start Date
          TextFormField(
            readOnly: true,
            onTap: () => pickDate(isStart: true),
            decoration: InputDecoration(
              labelText: 'Start Date',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today),
            ),
            controller: TextEditingController(
              text: startDate != null ? dateFormat.format(startDate!) : '',
            ),
          ),
          SizedBox(height: 12),
          // End Date
          TextFormField(
            readOnly: true,
            onTap: () => pickDate(isStart: false),
            decoration: InputDecoration(
              labelText: 'End Date',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today_outlined),
            ),
            controller: TextEditingController(
              text: endDate != null ? dateFormat.format(endDate!) : '',
            ),
          ),
          SizedBox(height: 20),
          // Price Summary
          if (startDate != null && endDate != null && getDaysDifference() > 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price per day: \$${pricePerDay.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Total: ${getDaysDifference()} x \$${pricePerDay.toStringAsFixed(2)} = \$${getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
              ],
            ),

          // Confirm Booking Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  (startDate != null &&
                          endDate != null &&
                          getDaysDifference() > 0)
                      ? () {
                        AppCubit.get(context).bookHotel(
                          model: widget.model,
                          checkInTime: DateFormat(
                            'yyyy - MM - dd',
                          ).format(startDate!),
                          checkOutTime: DateFormat(
                            'yyyy - MM - dd',
                          ).format(endDate!),
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Booking Confirmed!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Confirm Booking'),
            ),
          ),
        ],
      ),
    );
  }
}
