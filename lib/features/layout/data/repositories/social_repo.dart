import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';
import '../../../../core/errors/failure.dart';
import '../../../login/data/models/firebase_user_model.dart';
import '../../../login/data/models/hive_user_model.dart';


abstract class SocialRepo {
  Future<Either<Failure, HiveUserModel>> updateUserData({required FirebaseUserModel model, required String collection, required String password,required String id});
  Future<Either<Failure, String>> updatePassword({ required String newPassword});
  Future<Either<Failure, String>> chatBotMessage({ required String message});
  Future<Either<Failure, CarItem>> updateFavCars({ required CarItem data});

}
