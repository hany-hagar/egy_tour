import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tourist_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/destinations_search.dart';

class ListOfTopTouristItem extends StatelessWidget {
  final List<TourismModel> destinations ;
  const ListOfTopTouristItem({super.key, required this.destinations});

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
                "Top tourist destinations ",
                style: Styles.textStyle800.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                NavigatorMethods.push(context: context, nextPage: DestinationsSearch(destinations: destinations,));
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
              itemCount: destinations.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.25,
                mainAxisSpacing: 12.sp,
                crossAxisCount: 1,
              ),
              itemBuilder:
                  (context, index) => TouristItem(
                model: destinations[index],
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class TouristItemD extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double likes;
  const TouristItemD({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(image, fit: BoxFit.fill),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.textStyle800.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      height: 2,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      description,
                      maxLines: 3,
                      style: Styles.textStyle600.copyWith(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




