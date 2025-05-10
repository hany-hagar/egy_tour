import 'package:flutter/material.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';

class ListOfCars extends StatelessWidget {
  final List<CarModel> cars;
  const ListOfCars({
    super.key,
    required this.cars,
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
            itemCount: cars.length,
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
                    child: CarItem(model: cars[index]),
                  ),
                ),
        ),
      ],
    );
  }
}
