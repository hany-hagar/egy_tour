import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Favourites/list_of_fav_cars.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Favourites/list_of_fav_hotels.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Favourites/list_of_fav_tourisms.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Favourites/list_of_fav_tours.dart';

final List<String> reviewtypes = [
  'Tours',
  'Tourist attraction',
  'Hotel',
  'Car',
];

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SafeArea(
      child: DefaultTabController(
        length: reviewtypes.length,
        child: Column(
          children: [
            Text(
              "Order",
              style: Styles.textStyleBold.copyWith(fontSize: 25.sp),
            ),
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
                  ListOfFavTours(tours: cubit.tourBooking,emptyIcon: "assets/images/empty_order_icon.png",),
                  ListOfFavTourisms(destinations: cubit.tourismBooking,emptyIcon: "assets/images/empty_order_icon.png",),
                  ListOfFavHotels(hotels: cubit.hotelsBooking,emptyIcon: "assets/images/empty_order_icon.png",),
                  ListOfFavCars(cars: cubit.carBooking,emptyIcon: "assets/images/empty_order_icon.png",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
