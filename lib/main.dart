import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:egy_tour/core/utils/api_services.dart';
import 'package:egy_tour/core/utils/supabase_services.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tour_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tourism_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/login/data/models/hive_user_model.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/utils/styles.dart';
import 'features/login/data/repo/login_repo_impl.dart';
import 'features/login/presentation/manager/login_cubit.dart';
import 'features/splash/data/models/city_model.dart';
import 'features/splash/data/models/location_model.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  ApiServices.init();
  ApiServices.chatBotInit();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(LocationModelAdapter());
  Hive.registerAdapter(CityModelAdapter());
  Hive.registerAdapter(HiveUserModelAdapter());
  Hive.registerAdapter(ReviewModelAdapter());
  Hive.registerAdapter(TourModelAdapter());
  Hive.registerAdapter(HotelModelAdapter());
  Hive.registerAdapter(CarModelAdapter());
  Hive.registerAdapter(TourismModelAdapter());

  Hive.registerAdapter(HiveTourModelAdapter());
  Hive.registerAdapter(HiveCarModelAdapter());
  Hive.registerAdapter(HiveHotelModelAdapter());
  Hive.registerAdapter(HiveTourismModelAdapter());

  SupabaseServices.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to black
      statusBarIconBrightness: Brightness.dark, // White icons
    ),
  );
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
var overlayPortalController = OverlayPortalController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit()),
            BlocProvider(create: (context) => LoginCubit(LoginRepoImpl())),
          ],
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                theme: light,
                darkTheme: dark,
                themeMode: ThemeMode.light,
                // themeMode: ShopCubit.get(context).nightMode.value?ThemeMode.dark:ThemeMode.light,
                home: Directionality(
                  textDirection: TextDirection.ltr,
                  child: SplashView(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

ThemeData light = ThemeData(
  scaffoldBackgroundColor: Color(0xffEFF2EF),
  primaryColor: Colors.black,
  primaryColorLight: Colors.white,
  appBarTheme: AppBarTheme(
    color:Color(0xffEFF2EF),
    elevation: 0,
    scrolledUnderElevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Styles.defaultColor,
    elevation: 1,
    type: BottomNavigationBarType.fixed,
  ),
);
ThemeData dark = ThemeData(
  scaffoldBackgroundColor: Color(0xff242526),
  primaryColor: Colors.white,
  primaryColorLight: Color(0xff1e1e1e),
  appBarTheme: AppBarTheme(
    color: Color(0xff1e1e1e),
    elevation: 0,
    scrolledUnderElevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff1e1e1e),
    unselectedItemColor: Colors.white,
    selectedItemColor: CupertinoColors.systemGreen,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
  ),
);
