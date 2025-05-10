import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/cars_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';

class ListOfTopCarItem extends StatelessWidget {
  final List<CarModel> cars;
  const ListOfTopCarItem({super.key, required this.cars});

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
                "Top Car Rental",
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
                  nextPage: CarsSearch(cars: cars),
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
              itemCount: cars.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.25,
                mainAxisSpacing: 12.sp,
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) => CarItem(model: cars[index]),
            ),
          ),
        ),
      ],
    );
  }
}
