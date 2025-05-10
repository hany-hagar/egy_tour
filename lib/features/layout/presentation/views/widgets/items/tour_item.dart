import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/tour_details_screen.dart';

class TourItem extends StatelessWidget {
  final TourModel tour;
  const TourItem({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            GestureDetector(
              onTap:
                  () => NavigatorMethods.push(
                    context: context,
                    nextPage: TourDetailsScreen(tour: tour),
                  ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12, // Shadow color
                      spreadRadius: 1, // How far the shadow spreads
                      blurRadius: 10, // How blurry the shadow is
                      offset: Offset(0, 4), // Changes position of shadow (x,y)
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(tour.imageUrl),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 4,
                          bottom: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tour.name,
                              style: Styles.textStyle800.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                height: 2,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                tour.description,
                                maxLines: 4,
                                style: Styles.textStyle600.copyWith(
                                  color: Colors.grey,
                                  fontSize: 10.sp,
                                  height: 1,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.money,
                                        color: Colors.green,
                                        size: 12.sp,
                                      ),
                                      Text(
                                        " ${tour.price} ",
                                        style: Styles.textStyle800.copyWith(
                                          color: Colors.grey,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.deepOrange,
                                        size: 12.sp,
                                      ),
                                      Flexible(
                                        child: Text(
                                          " ${tour.rating}",
                                          style: Styles.textStyle800.copyWith(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => cubit.setFavItem(tour),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: EdgeInsetsDirectional.only(top: 8, end: 8),
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  cubit.setFavIcon(tour),
                  size: 24.sp,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
