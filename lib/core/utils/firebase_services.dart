
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../../features/login/data/models/firebase_user_model.dart';
import '../errors/failure.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Sign in with Email and Password
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword({required String email, required String password,}) async {
    try {
      final userCredential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  /// Register with Email and Password
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword({required String email, required String password,}) async {
    try {
      final userCredential =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  /// Send Verification Email
  Future<Either<Failure, bool>> sendVerificationEmail() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      return const Right(true);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  /// Send Password Reset Email
  Future<Either<Failure, bool>> sendResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(true);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  /// Add User Data to Firestore
  Future<Either<Failure, FirebaseUserModel>> addUserToFirestore({required FirebaseUserModel model, required String collection,required docName}) async {
    try {
      await _firestore.collection(collection).doc(docName).set(model.toJson());
      await _firestore.collection(collection).doc(docName).set(model.toJson());
      await _firestore.collection(collection).doc(docName).set(model.toJson());
      await _firestore.collection(collection).doc(docName).set(model.toJson());
      await _firestore.collection(collection).doc(docName).set(model.toJson());
      await _firestore.collection(collection).doc(docName).set(model.toJson());

      return  Right(model);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  /// Get User Data from Firestore
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getUserData({required String userId, required String collection,}) async {
    try {
      final document = await _firestore.collection(collection).doc(userId).get();
      return Right(document);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  /// Update User Data in Firestore
  Future<Either<Failure, FirebaseUserModel>> updateUserData({required FirebaseUserModel model, required String collection,required String id}) async {
    try {
      await _firestore.collection(collection).doc(id).update(model.toJson());
      return  Right(model);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }

  Future<Either<Failure, String>> updatePassword({ required String newPassword}) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
      return  Right(newPassword);
    } catch (onError) {
      return Left(_handleFirebaseError(onError));
    }
  }
  
  /// Handle Firebase Errors
  Failure _handleFirebaseError(dynamic error) {
    if (error is FirebaseAuthException || error is FirebaseException) {
      return FirebaseFailure.fromFirebaseException(error);
    }
    return FirebaseFailure(error.toString());
  }

}
