
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/country_item.dart';

class ListOfCountryItem extends StatelessWidget {
  final List<CountryModel> countries;
  final double topHeight;
  const ListOfCountryItem({super.key, required this.countries, this.topHeight = 15});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Column(
      children: [
        SizedBox(height: topHeight),
        Row(
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                "Your Next trip will be at ",
                style: Styles.textStyle800.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            
            SizedBox(width: 4),
          ],
        ),
        SizedBox(height: 10.sp),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 16),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.39,
                  child: GestureDetector(
                    onTap: () {
                      cubit.changeCurrentCountry(countries[1]);
                    },
                    child: CountryItem(
                      country: countries[1],
                    ),
                  ),
                ),
                SizedBox(width: 12.sp),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: countries.length - 2,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.58,
                    crossAxisSpacing: 12.sp,
                    mainAxisSpacing: 12.sp,
                    crossAxisCount: 2,
                  ),
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap: () {
                         cubit.changeCurrentCountry(countries[index+2]);
                        },
                        child: CountryItem(
                        country: countries[index+2],
                                        )
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
