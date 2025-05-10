import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_top_car.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_top_hotel_items.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_tour_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/top_tourist_destination.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/hotel_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tour_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tourist_item.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250.sp,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    NavigatorMethods.pop(context: context);
                    cubit.searchStart = false;
                    cubit.searchData.clear();
                    cubit.search.clear();
                  },
                  icon: Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.black,
                    size: 24.sp,
                  ),
                ),
                floating: false,
                pinned: true,
                stretch: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final isCollapsed =
                        constraints.biggest.height <= kToolbarHeight + 50;
                    final isCollapsedText =
                        constraints.biggest.height <= kToolbarHeight + 110;
                    return Stack(
                      children: [
                        // Background image (always full screen and behind)
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                cubit.currentCountry.images.first,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // White container with top rounded radius when collapsed
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color:
                                isCollapsed
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              isCollapsed
                                  ? Column(
                                    children: [
                                      SizedBox(height: kToolbarHeight - 20.sp),
                                      Text(
                                        'Explore',
                                        style: Styles.textStyle600.copyWith(
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                  : SizedBox(),
                            ],
                          ),
                        ),

                        // Title and country info
                        isCollapsedText
                            ? SizedBox()
                            : Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.currentCountry.name,
                                    style: Styles.textStyle800.copyWith(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Enjoy your wonderful day at ${cubit.currentCountry.name}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                      ],
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      child: CustomTextFormField(
                        height: 44.h,
                        borderWidth: 0.5,
                        borderRadius: 14,
                        controller: cubit.search,
                        isLabelText: false,
                        backgroundColor: Colors.white,
                        isEnablePrefixIcon: false,
                        isEnableSuffixIcon: true,
                        suffixIcon: IconBroken.Search,
                        title: 'Activites at ${cubit.currentCountry.name}',
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle400.copyWith(
                          fontSize: 14.sp,
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (p0) async {
                          if (p0!.isEmpty) {
                            cubit.searchStart = false;
                            cubit.searchData.clear();
                            cubit.search.clear();
                            cubit.searchOnTap();
                          } else {
                            if (!cubit.searchStart) {
                              cubit.searchStart = true;
                            }
                            cubit.searchOnTap();
                            await cubit.generalSearchItem(
                              text: p0.toString(),
                              cars: cars,
                              hotels: hotels,
                              tours: tours,
                              destinations: tourismDestinations,
                            );
                          }
                        },
                        onFieldSubmitted: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ),

                  cubit.searchStart
                      ? cubit.complete.isEmpty
                          ? SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.89,
                            child: Center(
                              child: LinearProgressIndicator(
                                color: defaultColor,
                              ),
                            ),
                          )
                          : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: ExploreSearchBody(items: cubit.complete)
                          )
                      : Expanded(child: ExploreBody()),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListOfTopTouristItem(destinations: tourismDestinations),
        ListOfTopHotelItem(hotels: hotels),
        ListOfTopCarItem(cars: cars),
        ListOfTopTourItem(tours: tours),
        SizedBox(height: 16.sp),
      ],
    );
  }
}

class ExploreSearchBody extends StatelessWidget {
  const ExploreSearchBody({super.key, required this.items});

  final List items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is TourismModel) {
          return TouristItem(model: item);
        } else if (item is TourModel) {
          return TourItem(tour: item);
        } else if (item is HotelModel) {
          return HotelItem(model: item);
        } else if (item is CarModel) {
          return CarItem(model: item);
        } else {
          return const SizedBox.shrink(); // Unknown type fallback
        }
      },
    );
  }
}
