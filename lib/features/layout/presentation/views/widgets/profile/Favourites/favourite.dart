import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
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

class Favourite extends StatelessWidget {
  const Favourite({super.key});

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
              "My Favourites",
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
                      ListOfFavTours(tours: cubit.favTour),
                      ListOfFavTourisms(destinations: cubit.favTourism),
                      ListOfFavHotels(hotels: cubit.favHotel),
                      ListOfFavCars(cars: cubit.favCar),
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
