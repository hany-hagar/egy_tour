import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:egy_tour/const/api_end_points.dart';
import 'package:egy_tour/features/splash/presentation/manager/splash_view_cubit/splash_cubit.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/hive_services.dart';
import '../models/firebase_user_model.dart';
import '../models/hive_user_model.dart';
import 'login_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, HiveUserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in user
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        return Left(ServerFailure("User authentication failed"));
      }

      // Refresh user data to get the latest email verification status
      await user.reload();

      // Check if email is verified
      if (!user.emailVerified) {
        return Left(FirebaseFailure("Email is not verified. Please verify your email."));
      }

      // Fetch user data from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(user.uid)
          .get();

      if (!userDoc.exists || userDoc.data() == null) {
        return Left(FirebaseFailure("User data not found in Firestore"));
      }

      HiveUserModel model = _mapUserData(userDoc.data()!, user.uid, password);

      // Check if user's city matches SplashCubit
      if (SplashCubit.standard.city.city == model.city) {
        return Right(model);
      }

      // Update user location
      try {
        FirebaseUserModel updatedData = FirebaseUserModel.fromJson(model.toJson());
        updatedData.country = SplashCubit.standard.city.country;
        updatedData.city = SplashCubit.standard.city.city;

        await FirebaseFirestore.instance
            .collection(userCollection)
            .doc(user.uid)
            .update(updatedData.toJson());

        // Return updated user data
        var update = _mapUserData(updatedData.toJson(), user.uid, password);
        return Right(update);
      } catch (updateError) {
        return Left(FirebaseFailure(updateError.toString()));
      }
    } catch (onError) {
      if (onError is FirebaseAuthException) {
        return Left(FirebaseFailure.fromFirebaseException(onError));
      }
      return Left(FirebaseFailure(onError.toString()));
    }
  }

// Helper function to map Firestore data
  HiveUserModel _mapUserData(Map<String, dynamic> data, String uid, String password) {
    return HiveUserModel.fromJson(data, uid, password);
  }
  @override
  Future<Either<Failure, String>> register({
    required String email,
    required String password,
  }) async
  {
    try {
      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password,);
      await response.user?.sendEmailVerification();
      return Right(response.user!.uid);
    } catch (onError) {
      if (onError is FirebaseAuthException) {
        return Left(FirebaseFailure.fromFirebaseAuthException(onError));
      }
      return Left(FirebaseFailure(onError.toString()));
    }
  }
  @override
  Future<Either<Failure, FirebaseUserModel>> addProfileData(FirebaseUserModel model, String id) async {
    try {
        FirebaseFirestore.instance.collection(userCollection).doc(id).set(model.toJson());
      return Right(model);
    } catch (onError) {
      if (onError is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(onError));
      }
      return Left(FirebaseFailure(onError.toString()));
    }
  }
  @override
  Future<Either<Failure, Iterable<HiveUserModel>>> fetchHiveLoginData() async {
    try {
      Iterable<HiveUserModel> data = await HiveServices().fetchHiveLoginData();
      // Map the Position to LocationModel

      return right(data);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, Iterable<HiveUserModel>>> addHiveLoginData(HiveUserModel model) async
  {
    try {
      Iterable<HiveUserModel> data = await HiveServices().addHiveLoginData(model);

      return right(data);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, Iterable<HiveUserModel>>> updateHiveLoginData(HiveUserModel model) async
  {
    try {
      Iterable<HiveUserModel> data = await HiveServices().updateHiveLoginData(model);
      return right(data);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, bool>> sendResetPasswordCode({
    required String email,
  }) async
  {
    try {
      final _ = await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right(true);
    } catch (onError) {
      if (onError is FirebaseAuthException) {
        return Left(FirebaseFailure.fromFirebaseAuthException(onError));
      }
      return Left(FirebaseFailure(onError.toString()));
    }
  }





}
