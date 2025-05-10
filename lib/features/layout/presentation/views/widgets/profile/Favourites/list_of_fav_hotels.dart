import 'package:flutter/material.dart';
import 'package:egy_tour/core/widgets/empty_view.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/hotel_item.dart';

class ListOfFavHotels extends StatelessWidget {

  final List<HotelModel> hotels;
      final String emptyIcon;
  const ListOfFavHotels({
    super.key,
    required this.hotels,
        this.emptyIcon = "assets/images/empty_favourite.png",

  });

  @override
  Widget build(BuildContext context) {
          return hotels.isEmpty
        ? EmptyView(tittle: "", image: emptyIcon)
        : Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            shrinkWrap: true,
            itemCount: hotels.length,
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
                    child: HotelItem(model: hotels[index]),
                  ),
                ),
        );

  }
}
