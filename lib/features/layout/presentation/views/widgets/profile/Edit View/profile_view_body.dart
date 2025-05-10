import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/account_view.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/edit_view.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Favourites/favourite.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Settings/setting_view.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/review/review.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Support/support.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/About%20Us/about_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    cubit.userInfo.image, // Replace with your image URL
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent[100],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.orange,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.userInfo.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      cubit.userInfo.nationality,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SettingButton(
                  icon: Icon(IconBroken.Profile),
                  name: 'Profile',
                  nextpage: EditView(),
                ),
                Divider(color: Colors.grey, indent: 16, endIndent: 16),
                SettingButton(
                  icon: Icon(IconBroken.Lock),
                  name: 'Account',
                  nextpage: AccountView(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            // height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SettingButton(
                  icon: Icon(IconBroken.Star),
                  name: 'Reviews',
                  nextpage: Review(),
                ),
                Divider(color: Colors.grey, indent: 16, endIndent: 16),
                SettingButton(
                  icon: Icon(IconBroken.Heart),
                  name: 'Favourites',
                  nextpage: Favourite(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            // height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SettingButton(
                  icon: Icon(IconBroken.Setting),
                  name: 'Settings',
                  nextpage: SettingView(),
                ),

                Divider(color: Colors.grey, indent: 16, endIndent: 16),
                SettingButton(
                  icon: Icon(Icons.phone),
                  name: 'Support',
                  nextpage: Support(),
                ),
                Divider(color: Colors.grey, indent: 16, endIndent: 16),
                SettingButton(
                  icon: Icon(IconBroken.Info_Circle),
                  name: 'About Us',
                  nextpage: AboutView(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            // height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                cubit.logout();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(IconBroken.Logout),
                      ),

                      Text(
                        "Sign out",
                        style: Styles.textStyle600.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(IconBroken.Arrow___Right_2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    required this.icon,
    required this.name,
    required this.nextpage,
  });

  final Icon icon;
  final String name;
  final Widget? nextpage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (nextpage != null) {
          return NavigatorMethods.push(context: context, nextPage: nextpage!);
        }
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(padding: const EdgeInsets.all(16.0), child: icon),

              Text(name, style: Styles.textStyle600.copyWith(fontSize: 18)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(IconBroken.Arrow___Right_2),
          ),
        ],
      ),
    );
  }
}
