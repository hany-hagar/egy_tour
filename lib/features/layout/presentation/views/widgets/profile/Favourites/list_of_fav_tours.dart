import 'package:flutter/material.dart';
import 'package:egy_tour/core/widgets/empty_view.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tour_item.dart';

class ListOfFavTours extends StatelessWidget {

  final List<TourModel> tours;
  final String emptyIcon;
  const ListOfFavTours({
    super.key,
    required this.tours,  
    this.emptyIcon = "assets/images/empty_favourite.png",
  });

  @override
  Widget build(BuildContext context) {
          return tours.isEmpty
        ? EmptyView(tittle: "", image: emptyIcon)
        : Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            shrinkWrap: true,
            itemCount: tours.length,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 2,
            ),
            itemBuilder:
                (context, index) => GestureDetector(
                    onTap: () {},
                    child: TourItem(tour:tours[index]),
                  ),
                ),
        );

  }
}
