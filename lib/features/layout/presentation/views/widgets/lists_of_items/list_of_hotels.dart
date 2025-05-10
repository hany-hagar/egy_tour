import 'package:flutter/material.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/hotel_item.dart';

class ListOfHotels extends StatelessWidget {
  final List<HotelModel> hotels;
  const ListOfHotels({
    super.key,
    required this.hotels,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            shrinkWrap: true,
            itemCount: hotels.length,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.9,
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
        ),
      ],
    );
  }
}
