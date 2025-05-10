import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/login/data/models/firebase_user_model.dart';
import '../../../../core/errors/failure.dart';
import '../models/hive_user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, HiveUserModel>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> register({
    required String email,
    required String password,
  });
  Future<Either<Failure, bool>> sendResetPasswordCode({required String email});
  Future<Either<Failure, FirebaseUserModel>> addProfileData(
    FirebaseUserModel model,
    String id
  );
  Future<Either<Failure, Iterable<HiveUserModel>>> fetchHiveLoginData();
  Future<Either<Failure, Iterable<HiveUserModel>>> addHiveLoginData(
    HiveUserModel model,

  );
  Future<Either<Failure, Iterable<HiveUserModel>>> updateHiveLoginData(HiveUserModel model,);
}
