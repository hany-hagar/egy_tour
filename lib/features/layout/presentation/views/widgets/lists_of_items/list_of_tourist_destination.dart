import 'package:flutter/material.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tourist_item.dart';

class ListOfTouristDestination extends StatelessWidget {
  final List<TourismModel> destinations;
  const ListOfTouristDestination({
    super.key,
    required this.destinations,
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
            itemCount: destinations.length,
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
                    child: TouristItem(model: destinations[index]),
                  ),
                ),
        ),
      ],
    );
  }
}
