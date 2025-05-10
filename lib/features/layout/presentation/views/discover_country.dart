import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/booking/destination_booking.dart';

class DiscoverState extends StatelessWidget {
  const DiscoverState({super.key, required this.state});
  final StateDataModel state;

  @override
  Widget build(BuildContext context) {
          return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            leading:  IconButton(
              onPressed:() => NavigatorMethods.pop(context: context) ,
              icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.black,
                  size: 24.sp,
                ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Discover ${state.name}',
                style: Styles.textStyleBold.copyWith(fontSize: 24.sp,color: Colors.deepOrange),
              ),
              background: Image.network(state.image, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.tourismLocations.length,
                  itemBuilder: (context, index) {
                    return StateTourismItem(
                      tourismLocations: state.tourismLocations[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}

class StateTourismItem extends StatelessWidget {
  const StateTourismItem({super.key, required this.tourismLocations});

  final TourismModel tourismLocations;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit,AppState>(builder: (context, state) {
          return GestureDetector(
            onTap: () {
              NavigatorMethods.push(context: context, nextPage: DestinationBooking(model:tourismLocations));
            },
            child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    tourismLocations.images.first,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.grey,
                        child: const Center(child: Icon(Icons.error)),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                onTap: () => cubit.setFavItem(tourismLocations),
                child: Icon(
                    cubit.setFavIcon(tourismLocations),
                    size: 25.sp,
                    color: Colors.red,
                  ),
              ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tourismLocations.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.orange,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        tourismLocations.location,
                        style: Styles.textStyle600.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    tourismLocations.location,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            starIndex < (tourismLocations.rating).round()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 24,
                          );
                        }),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  ],
                ),
              )
          );
    },);
  }
}
