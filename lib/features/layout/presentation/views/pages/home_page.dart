import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/explore.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/cars_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/destinations_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/tour_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/home/country_photo.dart';
import 'package:egy_tour/core/widgets/custom_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/home/services_container.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_top_car.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_tour_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_top_hotel_items.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/top_tourist_destination.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_country_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/hotels_search.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Favourites/favourite.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CountryPhoto(
                    image: cubit.currentCountry.images.first,
                    name: cubit.userInfo.name,
                    iconOnPressed: () {
                      NavigatorMethods.push(
                        context: context,
                        nextPage: Favourite(),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16,
                      end: 16,
                      top: 16,
                      bottom: 0,
                    ),
                    child: Column(
                      children: [
                        CustomSearch(
                          searchBarText:
                              "Activities at ${cubit.currentCountry.name}",
                        ),
                        const SizedBox(height: 4),
                        ServicesContainer(
                          tourOnTap: () {
                            NavigatorMethods.push(
                              context: context,
                              nextPage: TourSearch(tours: tours),
                            );
                          },
                          ticketOnTap: () {
                            NavigatorMethods.push(
                              context: context,
                              nextPage: DestinationsSearch(
                                destinations: tourismDestinations,
                              ),
                            );
                          },
                          hotelOnTap: () {
                            NavigatorMethods.push(
                              context: context,
                              nextPage: HotelsSearch(hotels: hotels),
                            );
                          },
                          carOnTap: () {
                            NavigatorMethods.push(
                              context: context,
                              nextPage: CarsSearch(cars: cars),
                            );
                          },
                          servicesOnTap: () {
                            NavigatorMethods.push(
                              context: context,
                              nextPage: Explore(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListOfCountryItem(countries: cubit.countryData,topHeight: 15.sp,),
                ListOfTopTouristItem(destinations: tourismDestinations),
                ListOfTopHotelItem(hotels: hotels),
                ListOfTopCarItem(cars: cars),
                ListOfTopTourItem(tours: tours),
                SizedBox(height: 16.sp),
              ]),
            ),
          ],
        );
      },
    );
  }
}
