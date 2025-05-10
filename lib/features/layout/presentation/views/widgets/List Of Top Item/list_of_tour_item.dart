import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/tour_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tour_item.dart';

class ListOfTopTourItem extends StatelessWidget {
  final List<TourModel> tours;
  const ListOfTopTourItem({super.key, required this.tours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.sp),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                "Top Tour Packages",
                style: Styles.textStyle800.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                NavigatorMethods.push(
                  context: context,
                  nextPage: TourSearch(tours: tours),
                );
              },
              icon: Icon(
                IconBroken.Arrow___Right_Circle,
                size: 25.sp,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
        SizedBox(height: 5.sp),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16),
          child: SizedBox(
            height: 200,
            child: GridView.builder(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              itemCount: tours.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.25,
                mainAxisSpacing: 12.sp,
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) => TourItem(tour: tours[index]),
            ),
          ),
        ),
      ],
    );
  }
}
