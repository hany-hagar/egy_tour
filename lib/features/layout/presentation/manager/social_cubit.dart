import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:egy_tour/const/api_end_points.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/hive_services.dart';
import 'package:egy_tour/core/utils/supabase_services.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tour_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tourism_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
import 'package:egy_tour/features/layout/data/repositories/social_repo_impl.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/home_page.dart';
import 'package:egy_tour/features/layout/presentation/views/older/order_screens/order_screen.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/profile_screen.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/search_screen.dart';
import 'package:egy_tour/features/login/data/models/firebase_user_model.dart';
import 'package:egy_tour/features/login/data/models/hive_user_model.dart';
import 'package:egy_tour/features/login/data/repo/login_repo_impl.dart';
part 'social_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(SocialInitial());
  late HiveUserModel userInfo;
  List<CountryModel> countryData = countries;
  var currentCountry = countries.first;
  List<CarModel> favCar = [];
  List<HotelModel> favHotel = [];
  List<TourModel> favTour = [];
  List<TourismModel> favTourism = [];

  List<HiveTourismModel> tourismReviews = [];
  List<HiveHotelModel> hotelsReviews = [];
  List<HiveTourModel> tourReviews = [];
  List<HiveCarModel> carReviews = [];

  List<HotelModel> hotelsBooking = [];
  List<TourModel> tourBooking = [];
  List<TourismModel> tourismBooking = [];
  List<CarModel> carBooking = [];


  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  List<Widget> screens = [
    const HomePage(),
    const SearchScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  PageController pageController = PageController();
  void changeBottomNavigationBarIndex(int index) {
    selectedIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(ChangeBottomNavigationBar());
  }
    void changeBottomNavigationBar(int index) {
    index = 0;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(ChangeBottomNavigationBar());
  }
  
  
  Future<void> addImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(SetImageLoading());
        final File file = File(image.path);
        final String path = '${userInfo.id}/${userInfo.photos.length}';
        var url = await SupabaseServices().uploadImage(
          fileName: path,
          profImage: file,
          bucketName: photoCollection,
        );
        var model = FirebaseUserModel.fromJson(userInfo.toJson());
        userInfo.photos.add(url);
        model.photos.add(url);
        await updateData(
          model: model,
          successState: SetImageSuccess(),
          failureState: (error) => SetImageFailure(error: error),
          id: userInfo.id,
        );
      }
    } catch (e) {
      emit(SetImageFailure(error: e.toString()));
    }
  }
  File profImage = File("");
  late String profImageUrl = userInfo.image;
  Future<void> setProfImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(SetProfileImageLoading());
        profImage = File(image.path);
        final String fileName = '${userInfo.id}/image';
        profImageUrl = await SupabaseServices().uploadImage(
          fileName: fileName,
          profImage: profImage,
          bucketName: userCollection,
        );
        final String file = '${userInfo.id}/${userInfo.photos.length}';
        var photoUrl = await SupabaseServices().uploadImage(
          fileName: file,
          profImage: profImage,
          bucketName: photoCollection,
        );
        var model = FirebaseUserModel.fromJson(userInfo.toJson());
        model.image = profImageUrl;
        model.photos.add(photoUrl);
        userInfo.photos.add(profImageUrl);
        await updateData(
          model: model,
          successState: SetProfileImageSuccess(),
          failureState: (error) => SetProfileImageFailure(error: error),
          id: userInfo.id,
        );
      }
    } catch (e) {
      emit(SetProfileImageFailure(error: e.toString()));
    }
  }




  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  late var userName = TextEditingController(text: userInfo.name.toString());
  late var phone = TextEditingController(text: userInfo.phone.toString());
  late var country = TextEditingController(
    text: userInfo.nationality.toString(),
  );
  late var email = TextEditingController(text: userInfo.email.toString());
  late var password = TextEditingController();
  late var newPassword = TextEditingController();
  late var city = TextEditingController(text: userInfo.city.toString());
  late var birthday = TextEditingController(text: userInfo.birthday.toString());
  Future<void> updateDataOnPressed() async {
    final model = FirebaseUserModel.fromJson(userInfo.toJson());
    if (updateFormKey.currentState!.validate()) {
      model.name = userName.text;
      model.bio = userName.text;
      model.phone = phone.text;
      model.city = userName.text;
      model.country = userName.text;
      model.birthday = birthday.text;
      emit(UpdateDataLoading());
      updateData(
        model: model,
        successState: UpdateDataSuccess(),
        failureState: (error) => UpdateDataFailure(error: error),
        id: userInfo.id,
      );
      // await updateData(model);
    } else {
      autoValidate = AutovalidateMode.always;
    }
  }
  Future<void> updateData({
    required FirebaseUserModel model,
    required AppState successState,
    required AppState Function(String error) failureState,
    required String id,
  }) async {
    var data = await SocialRepoImpl().updateUserData(
      model: model,
      collection: userCollection,
      password: userInfo.password,
      id: id,
    );
    data.fold((l) => emit(failureState(l.errMessage)), (r) {
      userInfo = r;
      log(r.favouriteCars.toString());
      emit(successState);
    });
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    await HiveServices()
        .deleteHiveLoginData(userInfo)
        .then((onValue) => emit(LogoutSuccess()))
        .catchError((error) => emit(LogoutFailure(error: error.toString())));
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    await HiveServices()
        .deleteHiveLoginData(userInfo)
        .then((onValue) => emit(DeleteAccountSuccess()))
        .catchError(
          (error) => emit(DeleteAccountFailure(error: error.toString())),
        );
  }

  void changePassword() {
    if (password.text.isNotEmpty && newPassword.text.isNotEmpty) {
      if (password.text == userInfo.password) {
        updatePassword();
      } else {
        emit(UpdatePasswordFailure(error: "Old Password is not correct"));
      }
    }
  }

  Future<void> updatePassword() async {
    emit(UpdatePasswordLoading());
    var data = await SocialRepoImpl().updatePassword(
      newPassword: newPassword.text,
    );
    data.fold((l) => emit(UpdatePasswordFailure(error: l.errMessage)), (r) {
      userInfo.password = newPassword.text;
      emit(UpdatePasswordSuccess());
      updateHiveLoginData(userInfo);
    });
  }

  Future<void> updateHiveLoginData(HiveUserModel model) async {
    emit(UpdateHiveLoginDataLoading());
    var result = await LoginRepoImpl().updateHiveLoginData(model);
    result.fold(
      (l) {
        emit(UpdateHiveLoginDataFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(UpdateHiveLoginDataSuccess());
      },
    );
  }
 

  // Reverse List
  List<T> reverseList<T>(List<T> originalList) {
  // Create a new list from the original to avoid modifying it
  List<T> reversedList = List<T>.from(originalList);
  // Reverse the new list
  return reversedList.reversed.toList();
}
  // Set Favourite
  void setFavItem(item) async {
    final model = FirebaseUserModel.fromJson(userInfo.toJson());
    if (item is TourismModel) {
      bool found = userInfo.favouritesTourisms.any(
        (data) => data.id == item.id,
      );
      found ? favTourism.remove(item) : favTourism.add(item);
      
    } else if (item is TourModel) {
      bool found = userInfo.favouriteTours.any((data) => data.id == item.id);
      found ? favTour.remove(item) : favTour.add(item);
    } else if (item is HotelModel) {
      bool found = userInfo.favouriteHotels.any((data) => data.id == item.id);
      found ? favHotel.remove(item) : favHotel.add(item);
      log("length : ${favHotel.length}");
    } else {
      bool found = userInfo.favouriteCars.any((data) => data.id == item.id);
      found ? favCar.remove(item) : favCar.add(item);
    }
    emit(AddFavItemLoading());
    model.favouriteCars = favCar;
    model.favouriteHotels = favHotel;
    model.favouriteTours = favTour;
    model.favouritesTourisms = favTourism;
    var data = await SocialRepoImpl().updateUserData(
      model: model,
      collection: userCollection,
      password: userInfo.password,
      id: userInfo.id,
    );
    data.fold(
      (l) {
        emit(AddFavItemFailure(error: l.errMessage));
      },
      (r) {
        userInfo = r;
        emit(AddFavItemSuccess());
      },
    );
  }
  IconData setFavIcon(item)  {
    if (item is TourismModel) {
      bool found = favTourism.any(
        (data) => data.id == item.id,
      );
    return found ? Icons.favorite : Icons.favorite_border;
    } else if (item is TourModel) {
      bool found = favTour.any((data) => data.id == item.id);
    return found ? Icons.favorite : Icons.favorite_border;
    } else if (item is HotelModel) {
      bool found = favHotel.any((data) => data.id == item.id);
    return found ? Icons.favorite : Icons.favorite_border;
    } else {
      bool found = favCar.any((data) => data.id == item.id);
    return found ? Icons.favorite : Icons.favorite_border;
    }
  }
  
  // Add Review
  int selectedStars = 0;
  var comment = TextEditingController();
  void setStars(index){
     selectedStars = index + 1;
    emit(SetState());
  }
  void addReview({required model , required index}) async {
    if (model is TourismModel) {
      var data = HiveTourismModel(reviewIndex: index, model: model);
      tourismReviews.add(data);
      
    } else if (model is TourModel) {
      var data = HiveTourModel(reviewIndex: index, model: model);
      tourReviews.add(data);
    } else if (model is HotelModel) {
      var data = HiveHotelModel(reviewIndex: index, model: model);
      hotelsReviews.add(data);
    } else {
      var data = HiveCarModel(reviewIndex: index, model: model);
      carReviews.add(data);
    }
    selectedStars = 0;
    comment.clear();
    emit(AddProductReview());
  }
  
  // addBooking
   void addBooking({required model}) async {
    if (model is TourismModel) {
      tourismBooking.add(model);
    } else if (model is TourModel) {
      tourBooking.add(model);
    } else if (model is HotelModel) {
      hotelsBooking.add(model);
    } else {
      carBooking.add(model);
    }
    emit(AddProductReview());
  }
  



  // Search Type Item
  var search = TextEditingController();
  bool searchStart = false;
  List searchData = [];
  void searchOnTap() {
    emit(SearchProduct());
  }
  Future<void> searchItem({required String text, required List list}) async {
    if (text.isNotEmpty) {
      text.toLowerCase();
      Future.delayed(const Duration(seconds: 1));
      searchData =
          list
              .where((element) => element.name.toLowerCase().contains(text))
              .toList();
      emit(SearchProduct());
    } else {
      emit(SearchProduct());
    }
  }
  List searchDestinationsData = [];
  List searchToursData = [];
  List searchHotelsData = [];
  List searchCarData = [];
  List<dynamic> complete = [];
  Future<void> generalSearchItem({
    required String text,
    required List destinations,
    required List tours,
    required List hotels,
    required List cars,
  }) async {
    if (text.isNotEmpty) {
      text.toLowerCase();
      Future.delayed(const Duration(seconds: 1));
      searchDestinationsData =
          destinations
              .where((element) => element.name.toLowerCase().contains(text))
              .toList();
      searchToursData =
          tours
              .where((element) => element.name.toLowerCase().contains(text))
              .toList();
      searchHotelsData =
          hotels
              .where((element) => element.name.toLowerCase().contains(text))
              .toList();
      searchCarData =
          cars
              .where((element) => element.name.toLowerCase().contains(text))
              .toList();
      log("Search Data: $searchDestinationsData", name: "Search Data");
      log("Search Data: $searchToursData", name: "Search Data");
      log("Search Data: $searchHotelsData", name: "Search Data");
      log("Search Data: $searchCarData", name: "Search Data");
      log("--------------------------");
      // Combine the filtered lists (they are now all of type TourismModel)
      complete
        ..addAll(searchDestinationsData)
        ..addAll(searchToursData)
        ..addAll(searchHotelsData)
        ..addAll(searchCarData);

      log("Data: $complete", name: "Complete Data");
      emit(SearchProduct());
    } else {
      emit(SearchProduct());
    }
  }

  
  // Add Fav Item

  void bookHotel({
    required HotelModel model,
    required String checkInTime,
    required String checkOutTime,
  }) {
    emit(Booking());
    var data = model;
    model.checkInTime = checkInTime;
    model.checkOutTime = checkOutTime;
    hotelsBooking.add(data);
    emit(Booking());
  }

  void review(){
    emit(SetState());
  }


  // Change Current Country

  void changeCurrentCountry(CountryModel country){
    var countries = countryData;
    countries.remove(country);
    countries.insert(0, country);
    countryData = countries;
    currentCountry = country;
    changeBottomNavigationBarIndex(0);
  }

}
