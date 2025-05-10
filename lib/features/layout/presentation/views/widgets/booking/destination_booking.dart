import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/data/models/hive_tourism_model.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/review_item.dart';

class DestinationBooking extends StatefulWidget {
  final TourismModel model;

  const DestinationBooking({super.key, required this.model});

  @override
  State<DestinationBooking> createState() => _DestinationBookingState();
}

class _DestinationBookingState extends State<DestinationBooking>
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
    var cubit = AppCubit.get(context);
    ScreenUtil.init(context, designSize: const Size(375, 812));
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
              SizedBox(width: 10.w),
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
                        widget.model.images.first,
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
                          widget.model.location,
                          style: Styles.textStyle800.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Icon(Icons.star, size: 16.sp, color: Colors.amber),
                        SizedBox(width: 4.w),
                        Text(
                          '${widget.model.rating} (${widget.model.numberOfRatings} reviews)',
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
                                    images: widget.model.images,
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
  final TourismModel model;
  const BookingBar({super.key, required this.context, required this.model});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
      var cubit = AppCubit.get(context);
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
                '\$${extractPriceAndCurrency(model.price)}',
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
                cubit.addBooking(model: model);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Booking confirmed!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: defaultColor,
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
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
  final TourismModel model;
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
              padding: EdgeInsetsDirectional.only(end: 16,bottom: 16),
              child: ReviewItem(review: model.reviews[index])
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

class OverViewBody extends StatelessWidget {
  final TourismModel model;
  const OverViewBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.access_time, size: 18.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text(
                model.openTime,
                style: Styles.textStyle800.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(Icons.money, size: 18.sp, color: Colors.green),
              SizedBox(width: 4.w),
              Text(
                model.price,
                style: Styles.textStyle800.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Description',
            style: Styles.textStyle800.copyWith(fontSize: 15.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            model.description,
            style: Styles.textStyle800.copyWith(fontSize: 12.sp),
            maxLines: 5,
          ),
          SizedBox(height: 16.h),
          Text(
            'Facilities',
            style: Styles.textStyle800.copyWith(fontSize: 14.sp),
          ),
          SizedBox(height: 10.h),
          Wrap(
            spacing: 5.w,
            runSpacing: 0.h,
            children: List.generate(
              model.facilities.length,
              (index) => Chip(
                label: Text(
                  model.facilities[index],
                  style: Styles.textStyle800.copyWith(fontSize: 12.sp),
                ),
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
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
  final TourismModel model;

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
            backgroundColor: Colors.grey.shade100,
            isHiddenInputBorder: true,
            enableCompleteStyle: true,
            completeStyle: Styles.textStyle500.copyWith(fontSize: 16.sp),
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
                var data = HiveTourismModel(reviewIndex: widget.model.reviews.length-1, model: widget.model);
                cubit.tourismReviews.add(data);
                comment.clear();
                selectedStars = 0;
                setState(() {});
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
              backgroundColor: defaultColor,
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
