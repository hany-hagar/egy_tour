import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';

class CountryItem extends StatelessWidget {
  final CountryModel country;
  const CountryItem({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(country.images.first)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "👑 No.${country.id} ",
            style: Styles.textStyle800.copyWith(
              color: Colors.white,
              fontSize: 10.sp,
            ),
          ),
          Text(
            country.name,
            style: Styles.textStyle800.copyWith(
              color: Colors.white,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
