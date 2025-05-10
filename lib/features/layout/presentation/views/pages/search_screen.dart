import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/country_card.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/discover_country.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/List%20Of%20Top%20Item/list_of_country_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/country_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: TouristDestinationsScreen());
  }
}

class TouristDestinationsScreen extends StatelessWidget {
  const TouristDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Explore",
                style: Styles.textStyleBold.copyWith(fontSize: 25.sp),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 44.h,
                  child: CustomTextFormField(
                    borderWidth: 0.5,
                    borderRadius: 14,
                    controller: cubit.search,
                    isLabelText: false,
                    backgroundColor: Colors.white,
                    isEnablePrefixIcon: false,
                    isEnableSuffixIcon: true,
                    suffixIcon: IconBroken.Search,
                    title: 'Search On Governorates',
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
                        await cubit.searchItem(
                          text: p0.toString(),
                          list: egyptGovernorates,
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
                  ? cubit.searchData.isEmpty
                      ? SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.89,
                        child: Center(
                          child: LinearProgressIndicator(color: defaultColor),
                        ),
                      )
                      : ListOfStatus(
                        states: cubit.searchData as List<StateDataModel>,
                      )
                  : SearchScreenBody(),
            ],
          ),
        );
      },
    );
  }
}

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListOfCountryItem(countries: countries, topHeight: 0.sp),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Status",
              style: Styles.textStyle800.copyWith(fontSize: 18.sp),
            ),
          ),
        ),
        ListOfStatus(states: egyptGovernorates),
      ],
    );
  }
}

class TopLocationSelectedByUs extends StatelessWidget {
  const TopLocationSelectedByUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListOfCountryItem(countries: countries),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your next trip will be at",
              style: Styles.textStyle800.copyWith(fontSize: 18.sp),
            ),
          ),
        ),
        SizedBox(height: 10.sp),

        SizedBox(
          height: 190,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 16),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.39,
                  child: CountryItem(country: countries[1]),
                ),
                SizedBox(width: 12.sp),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: AppCubit.get(context).countryData.length - 2,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.58,
                    crossAxisSpacing: 12.sp,
                    mainAxisSpacing: 12.sp,
                    crossAxisCount: 2,
                  ),
                  itemBuilder:
                      (context, index) => CountryItem(
                        country: AppCubit.get(context).countryData[index + 2],
                      ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5.sp),
      ],
    );
  }
}

class ListOfStatus extends StatelessWidget {
  final List<StateDataModel> states;
  const ListOfStatus({super.key, required this.states});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        shrinkWrap: true,
        itemCount: states.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {
                NavigatorMethods.push(
                  context: context,
                  nextPage: DiscoverState(state: states[index]),
                );
              },
              child: StateItem(state: states[index]),
            ),
      ),
    );
  }
}
