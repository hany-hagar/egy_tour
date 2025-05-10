import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/lists_of_items/list_of_tourist_destination.dart';

class DestinationsSearch extends StatelessWidget {
  final List<TourismModel> destinations;
  const DestinationsSearch({super.key, required this.destinations});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tourism Destinations', style: Styles.textStyle600),
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
                    title: 'Search On Tourism Destinations',
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
                        await cubit.searchItem(text: p0.toString(),
                            list: destinations,);
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
                      : Expanded(
                        child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListOfTouristDestination(
                        destinations: cubit.searchData as List<TourismModel>,
                      ),
                        ),
                        
                      )
                  : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListOfTouristDestination(
                        destinations: destinations,
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

