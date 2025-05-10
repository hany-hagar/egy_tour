// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';

class StateItem extends StatelessWidget {
  const StateItem({super.key, required this.state});

  final StateDataModel state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(state.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.black.withOpacity(0.4),
          ),
          child: Text(
            state.name,
            maxLines: 2,
            style: Styles.textStyle800.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: state.name.length>8 ?  20.sp  : state.name.length ==8 ? 25:30.sp
            ),

            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
