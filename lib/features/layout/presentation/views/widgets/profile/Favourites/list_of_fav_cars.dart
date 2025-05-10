import 'package:flutter/material.dart';
import 'package:egy_tour/core/widgets/empty_view.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';

class ListOfFavCars extends StatelessWidget {
  final List<CarModel> cars;
  final String emptyIcon;
  const ListOfFavCars({
    super.key,
    required this.cars,
    this.emptyIcon = "assets/images/empty_favourite.png",
  });

  @override
  Widget build(BuildContext context) {
    return cars.isEmpty
        ? EmptyView(tittle: "", image: emptyIcon)
        : Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            shrinkWrap: true,
            itemCount: cars.length,
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
                  child: CarItem(model: cars[index]),
                ),
          ),
        );
  }
}
