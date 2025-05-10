import 'package:flutter/material.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/widgets/empty_view.dart';
import 'package:egy_tour/features/layout/data/models/hive_tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/booking/destination_booking.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/review_item.dart';

class ListOfTourismAttractionItemsReviews extends StatelessWidget {

  final List<HiveTourismModel> model;
  const ListOfTourismAttractionItemsReviews({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
     return model.isEmpty 
     ? EmptyView(tittle: "", image: "assets/images/empty_favourite.png")
     :ListView.builder(
      padding: EdgeInsetsDirectional.only(end: 16,bottom: 16),
      itemCount: model.length,
      itemBuilder: (context, index) {
       return GestureDetector(
          onTap: () {
            NavigatorMethods.push(context: context, nextPage: DestinationBooking(model: model[index].model));
          },
          child: ReviewItem(review: model[index].model.reviews[model[index].reviewIndex]),
        );
     },);
        
  }
}  