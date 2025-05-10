import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/chat_bot.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF1F1F1),
          body: PageView(
            controller: cubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: cubit.screens,
          ),
          bottomNavigationBar: AppNavigationBar(cubit: cubit),
          floatingActionButton: GestureDetector(
            onTap:
                () => NavigatorMethods.push(
                  context: context,
                  nextPage: ChatBotScreen(),
                ),
            child: Container(
              width: 60,
              height: 60,
              margin: EdgeInsetsDirectional.only(
                bottom: MediaQuery.of(context).padding.bottom + 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(
                      0.2,
                    ), // Adjust shadow color and opacity
                    spreadRadius: 2, // Spread radius of the shadow
                    blurRadius: 5, // Blur radius for soft edges
                    offset: Offset(0, 3), // Offset for shadow position
                  ),
                ],
              ),
              child: Icon(FontAwesomeIcons.robot, size: 30, color: Colors.blue),
            ),
          ),
        );
      },
    );
  }
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key, required this.cubit});

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: cubit.selectedIndex,
      height: 60,
      buttonBackgroundColor: Colors.orange,
      backgroundColor: const Color(0xFFF1F1F1),
      items: [
        CurvedNavigationBarItem(
          child: Icon(
            Icons.home,
            size: 30,
            color: cubit.selectedIndex == 0 ? Colors.white : Colors.grey,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.location_on_rounded,
            size: 30,
            color: cubit.selectedIndex == 1 ? Colors.white : Colors.grey,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.shopping_bag,
            size: 30,
            color: cubit.selectedIndex == 2 ? Colors.white : Colors.grey,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.person,
            size: 30,
            color: cubit.selectedIndex == 3 ? Colors.white : Colors.grey,
          ),
        ),
      ],
      animationDuration: Duration(milliseconds: 600),
      animationCurve: Curves.easeInOut,
      onTap: (index) {
        cubit.changeBottomNavigationBarIndex(index);
        cubit.searchStart = false;
        cubit.searchData.clear();
        cubit.search.clear();
      },
      letIndexChange: (index) => true,
    );
  }
}
