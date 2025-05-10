import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/booking/hotel_booking.dart';

class HotelItem extends StatelessWidget {
  final HotelModel model;
  const HotelItem({super.key, required this.model});

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
                    nextPage: HotelBooking(model: model),
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
                            image: NetworkImage(model.roomImages.first),
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
                              model.name,
                              style: Styles.textStyle800.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                height: 2,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                model.description,
                                maxLines: 3,
                                style: Styles.textStyle600.copyWith(
                                  color: Colors.grey,
                                  fontSize: 11.sp,
                                  height: 1,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.sp),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.deepOrange,
                                        size: 12.sp,
                                      ),
                                      Text(
                                        " ${model.rating} ",
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
                                        Icons.location_on,
                                        color: Colors.grey,
                                        size: 12.sp,
                                      ),
                                      Flexible(
                                        child: Text(
                                          " ${model.address}",
                                          style: Styles.textStyle800.copyWith(
                                            color: Colors.grey,
                                            fontSize: 11.sp,
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
              onTap: () => cubit.setFavItem(model),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: EdgeInsetsDirectional.only(top: 8, end: 8),
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  cubit.setFavIcon(model),
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
