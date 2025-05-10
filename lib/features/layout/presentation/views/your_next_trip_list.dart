import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/country_item.dart';


class YourNextTripList extends StatelessWidget {
   const YourNextTripList({super.key});

   @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          onPressed: () => NavigatorMethods.pop(context: context),
          icon: Icon(IconBroken.Arrow___Left_2,color: Colors.black,size: 24.sp,),
        ),

        backgroundColor: Colors.white,
        title: Text(
          'Egypt',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cubit.countryData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                cubit.currentCountry = cubit.countryData[index];
              },
              child: CountryItem(
                
                country:cubit.countryData[index],
              ),
            );
          },
        ),
      ),

    );
  }
}
