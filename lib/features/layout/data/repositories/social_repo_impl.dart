import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:egy_tour/core/errors/failure.dart';
import 'package:egy_tour/core/utils/api_services.dart';
import 'package:egy_tour/core/utils/firebase_services.dart';
import 'package:egy_tour/features/layout/data/repositories/social_repo.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/car_item.dart';
import 'package:egy_tour/features/login/data/models/firebase_user_model.dart';
import 'package:egy_tour/features/login/data/models/hive_user_model.dart';


class SocialRepoImpl extends SocialRepo{

  @override
  Future<Either<Failure, HiveUserModel>> updateUserData({required FirebaseUserModel model, required String collection, required String password,required String id}) async {
    final data = await FirebaseServices().updateUserData(model: model, collection: collection,id: id);
    return data.fold(
          (l) => left(l),
           (r) {
             HiveUserModel model = HiveUserModel.fromJson(r.toJson(), id, password);
             return right(model);
           },
    );
  }
  
  @override
  Future<Either<Failure, String>> updatePassword({required String newPassword}) async {
    final data = await FirebaseServices().updatePassword(newPassword: newPassword);
    return data.fold(
          (l) => left(l),
           (r) {
             return right(r);
           },
    );
    
  }
  
  @override
  Future<Either<Failure, String>> chatBotMessage({required String message}) async {
        try {
        final data = await ApiServices().getGeminiResponse(message);
       String messageData = data?.data["candidates"][0]["content"]["parts"][0]["text"];      
       return  Right(messageData);
    } catch (onError) {
      if (onError is DioException) {
        return Left(ServerFailure.fromDioError(onError));
      }
      return Left(ServerFailure(onError.toString()));
    }

  }

  @override
  Future<Either<Failure, CarItem>> updateFavCars({required CarItem data}) {
    throw UnimplementedError();
  }





 

}