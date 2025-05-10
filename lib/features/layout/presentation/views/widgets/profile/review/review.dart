import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/list_of_car_reviews_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/list_of_hotel_items_reviews.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/list_of_tour_reviews_items.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/list_of_tourist_attraction_reviews_items.dart';

final List<String> reviewtypes = [
  'Tours',
  'Tourist attraction',
  'Hotel',
  'Car',
];

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => NavigatorMethods.pop(context: context),
              icon: Icon(IconBroken.Arrow___Left_2),
            ),
            title: Text(
              "My Reviews",
              style: Styles.textStyle800.copyWith(
                fontSize: 20.sp,
                color: defaultColor,
              ),
            ),
            centerTitle: true,
          ),
          body: DefaultTabController(
            length: reviewtypes.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabs: List.generate(
                    reviewtypes.length,
                    (index) => Tab(text: reviewtypes[index]),
                  ),
                  labelStyle: Styles.textStyle600.copyWith(fontSize: 14.sp),
                  unselectedLabelStyle: Styles.textStyle400.copyWith(
                    fontSize: 14.sp,
                  ),
                  indicatorColor: defaultColor,
                  labelColor: defaultColor,
                  unselectedLabelColor: Styles.fontOpacityColor,
                  dividerHeight: 0,
                  dragStartBehavior: DragStartBehavior.start,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListOfTourItemsReviews(model: cubit.tourReviews),
                      ListOfTourismAttractionItemsReviews(
                        model: cubit.tourismReviews,
                      ),
                      ListOfHotelItemsReviews(
                        model: cubit.hotelsReviews,
                      ),
                      ListOfCarReviewsItem(model: cubit.carReviews),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
