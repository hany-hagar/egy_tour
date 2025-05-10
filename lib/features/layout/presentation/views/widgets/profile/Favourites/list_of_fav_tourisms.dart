import 'package:flutter/material.dart';
import 'package:egy_tour/core/widgets/empty_view.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tourist_item.dart';

class ListOfFavTourisms extends StatelessWidget {

  final List<TourismModel> destinations;
    final String emptyIcon;
  const ListOfFavTourisms({
    super.key,
    required this.destinations, 
    this.emptyIcon = "assets/images/empty_favourite.png",
  });

  @override
  Widget build(BuildContext context) {
          return destinations.isEmpty
        ? EmptyView(tittle: "", image: emptyIcon)
        : Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            shrinkWrap: true,
            itemCount: destinations.length,
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
                    child: TouristItem(model: destinations[index]),
                  ),
                ),
        );

  }
}
