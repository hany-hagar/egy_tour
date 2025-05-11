// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/supabase_services.dart';
import 'package:egy_tour/features/login/data/models/firebase_user_model.dart';
import 'package:egy_tour/features/login/data/models/hive_user_model.dart';
import '../../../../const/api_end_points.dart';
import '../../../../core/utils/hive_services.dart';
import '../../data/repo/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  final LoginRepo loginRepo;

  //-------------------SignIn----------------------
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  var loginEmail = TextEditingController();
  var loginPassword = TextEditingController();
  bool signInTextObscure = false;
  static List<HiveUserModel> loginData = [];
  static bool firstLogin = true;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  void changeSignInTextObscure() {
    signInTextObscure = !signInTextObscure;
    emit(ChangeLoginObscureText());
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoading());
    var loginData = await loginRepo.signIn(
      email: loginEmail.text,
      password: loginPassword.text,
    );
    loginData.fold(
      (l) {
        log("Error : ${l.errMessage}");
        emit(LoginFailure(error: l.errMessage));
      },
      (r) {
        loginEmail.clear();
        loginPassword.clear();
        emit(LoginSuccess(loginData: r));
        if (firstLogin) {
          addHiveLoginData(r);
        } else {
          updateHiveLoginData(r);
        }
      },
    );
  }

  void signInOnPressed() {
    if (signInFormKey.currentState!.validate()) {
      signIn(email: loginEmail.text, password: loginPassword.text);
    } else {
      autoValidate = AutovalidateMode.always;
      emit(ChangeLoginAutoValidate());
    }
  }

  Future<void> autoSignIn() async {
    emit(AutoLoginLoading());
    HiveServices()
        .fetchHiveLoginData()
        .then((onValue) async {
          if (onValue.isEmpty) {
            emit(AutoLoginFailure(error: "error"));
          } else {
            var loginData = await loginRepo.signIn(
              email: onValue.first.email,
              password: onValue.first.password,
            );
            loginData.fold((l) => emit(AutoLoginFailure(error: l.errMessage)), (
              r,
            ) async {
              emit(AutoLoginSuccess(loginData: r));
              updateHiveLoginData(r);
            });
          }
        })
        .catchError((onError) {
          emit(AutoLoginFailure(error: onError.toString()));
        });
  }

  Future<void> fetchHiveLoginData() async {
    emit(FetchHiveLoginDataLoading());
    var result = await loginRepo.fetchHiveLoginData();
    result.fold(
      (l) {
        emit(FetchHiveLoginDataFailure(error: l.errMessage));
      },
      (r) {
        emit(FetchHiveLoginDataSuccess(loginModel: r.first));
      },
    );
  }

  Future<void> addHiveLoginData(HiveUserModel model) async {
    emit(AddHiveLoginDataLoading());
    var result = await loginRepo.addHiveLoginData(model);
    result.fold(
      (l) {
        emit(AddHiveLoginDataFailure(error: l.errMessage.toString()));
        log("AddHiveLoginDataFailure : ${l.errMessage.toString()}");
      },
      (r) {
        emit(AddHiveLoginDataSuccess(loginModel: r.first));
        loginData.clear();
        loginData.add(model);
        fetchHiveLoginData();
      },
    );
  }

  updateHiveLoginData(HiveUserModel model) async {
    emit(UpdateHiveLoginDataLoading());
    var result = await loginRepo.updateHiveLoginData(model);
    result.fold(
      (l) {
        emit(UpdateHiveLoginDataFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(UpdateHiveLoginDataSuccess(loginModel: r.first));
        loginData.clear();
        loginData.add(model);
        fetchHiveLoginData();
      },
    );
  }

  //-------------------Register----------------------
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var registerUserName = TextEditingController();
  var registerEmail = TextEditingController();
  var registerPhone = TextEditingController();
  var registerPassword = TextEditingController();
  var searchController = TextEditingController();
  TextEditingController registerNationalityController = TextEditingController();
  var birthday = TextEditingController();
  Map<String, String>? selectedNationality;

  bool registerTextObscure = false;
  AutovalidateMode registerAutoValidate = AutovalidateMode.disabled;
  void changeRegisterTextObscure() {
    registerTextObscure = !registerTextObscure;
    emit(ChangeRegisterObscureText());
  }

  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required String phone,
    required String nationality,
  }) async {
    emit(RegisterLoading());

    var loginData = await loginRepo.register(email: email, password: password);
    loginData.fold(
      (l) {
        emit(RegisterFailure(error: l.errMessage));
      },
      (r) async {
        var profile = await SupabaseServices().uploadAssetImage(
          imagePath: "assets/images/profile.png",
          bucketName: userCollection,
          fileName: "${r.toString()}/image",
        );
        FirebaseUserModel model = FirebaseUserModel(
          birthday: birthday.text,
          nationality: nationality,
          email: email,
          name: userName,
          phone: phone,
          image: profile,
          favouritesTourisms: [],
          favouriteTours: [],
          favouriteHotels: [],
          favouriteCars: [],
          freviewTourisms: [],
          reviewTours: [],
          reviewHotels: [],
          reviewCars: [],
        );
        addProfileData(id: r, model: model);
      },
    );
  }

  Future<void> addProfileData({
    required String id,
    required FirebaseUserModel model,
  }) async {
    var loginData = await loginRepo.addProfileData(model, id);
    loginData.fold(
      (l) {
        log("Add Profile Data Failure : ${l.errMessage.toString()}");
        emit(AddProfileDataFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(RegisterSuccess(model: r));
        registerUserName.clear();
        registerPhone.clear();
        registerEmail.clear();
        registerPassword.clear();
      },
    );
  }

  void showNationalityPicker(BuildContext context, LoginCubit cubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        TextEditingController searchController = TextEditingController();
        List<Map<String, String>> filteredList = List.from(nationalities);

        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search nationality...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          filteredList =
                              nationalities.where((item) {
                                return item['name']!.toLowerCase().contains(
                                  value.toLowerCase(),
                                );
                              }).toList();
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final nationality = filteredList[index];
                          return ListTile(
                            leading: Text(
                              nationality['flag']!,
                              style: TextStyle(fontSize: 24),
                            ),
                            title: Text(nationality['name']!),
                            onTap: () {
                              cubit.registerNationalityController.text =
                                  '${nationality['flag']} ${nationality['name']}';
                              cubit.selectedNationality = nationality;
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> selectDate({required BuildContext context}) async {
    DateTime initialDate = DateTime.now().subtract(
      const Duration(days: 365 * 18),
    );
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: 'Select Your Birthday',
    );
    if (pickedDate != null) {
      birthday.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      // ignore: use_build_context_synchronously
      FocusScope.of(context).unfocus();
    }
  }

  void registerOnPressed() {
    if (registerFormKey.currentState!.validate()) {
      register(
        email: registerEmail.text,
        password: registerPassword.text,
        userName: registerUserName.text,
        phone: registerPhone.text,
        nationality: registerNationalityController.text,
      );
    } else {
      autoValidate = AutovalidateMode.always;
      emit(ChangeRegisterAutoValidate());
    }
  }

  //-------------------Forget Password----------------------
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  var resetEmail = TextEditingController();
  AutovalidateMode forgetPasswordAutoValidate = AutovalidateMode.disabled;
  void sendEmailOnPressed() {
    if (forgetPasswordFormKey.currentState!.validate()) {
      sendResetPasswordCode(email: resetEmail.text);
    } else {
      autoValidate = AutovalidateMode.always;
      emit(ChangeRegisterAutoValidate());
    }
  }

  Future<void> sendResetPasswordCode({required String email}) async {
    emit(SendMailLoading());
    var loginData = await loginRepo.sendResetPasswordCode(email: email);
    loginData.fold(
      (l) {
        emit(SendMailFailure(error: l.errMessage.toString()));
      },
      (r) {
        emit(SendMailSuccess());
      },
    );
  }
}
