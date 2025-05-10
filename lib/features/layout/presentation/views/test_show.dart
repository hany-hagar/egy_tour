import 'package:flutter/material.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/hotel_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tour_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/tourist_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/lists_of_items/list_of_cars.dart';

class TestShow extends StatelessWidget {
  const TestShow({super.key});

  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('General Search', style: Styles.textStyle600),
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
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 50.h,
                  child: CustomTextFormField(
                    borderWidth: 0.5,
                    borderRadius: 14,
                    controller: cubit.search,
                    isLabelText: false,
                    backgroundColor: Colors.white,
                    isEnablePrefixIcon: false,
                    isEnableSuffixIcon: true,
                    suffixIcon: IconBroken.Search,
                    title: 'General Search',
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
                          child: LinearProgressIndicator(color: defaultColor),
                        ),
                      )
                      : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TestBody(
                            items: cubit.complete
                          ),
                        ),
                      )
                  : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListOfCars(cars: cars),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

class TestBody extends StatelessWidget {
  const TestBody({super.key, required this.items});

  final List items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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

