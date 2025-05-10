import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      // ignore: constant_pattern_never_matches_value_type
      case DioExceptionType.values:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again${dioError.message}');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

class HiveFailure extends Failure {
  HiveFailure(super.errMessage);

  factory HiveFailure.fromHiveError(HiveError hiveError) {
    if (hiveError.message.contains('Box not found')) {
      return HiveFailure('The requested Hive box was not found.');
    } else if (hiveError.message.contains('Box is already open')) {
      return HiveFailure('The Hive box is already open.');
    } else if (hiveError.message.contains('Corrupted box file')) {
      return HiveFailure('The Hive box file is corrupted. Please clear the data and try again.');
    } else if (hiveError.message.contains('Read-only file system')) {
      return HiveFailure('The Hive box is on a read-only file system and cannot be written to.');
    } else {
      return HiveFailure('Unexpected Hive error: ${hiveError.message}');
    }
  }

  factory HiveFailure.fromException(dynamic exception) {
    if (exception is HiveError) {
      return HiveFailure.fromHiveError(exception);
    } else {
      return HiveFailure('An unknown error occurred while using Hive: ${exception.toString()}');
    }
  }
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errMessage);

  factory FirebaseFailure.fromFirebaseAuthException(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return FirebaseFailure('The email address is not valid.');
      case 'user-disabled':
        return FirebaseFailure('This user has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found for this email.');
      case 'wrong-password':
        return FirebaseFailure('Incorrect password provided.');
      case 'email-already-in-use':
        return FirebaseFailure('The email is already in use.');
      case 'operation-not-allowed':
        return FirebaseFailure('This operation is not allowed.');
      case 'weak-password':
        return FirebaseFailure('The password is too weak.');
      default:
        return FirebaseFailure('Unexpected Firebase Auth error: ${exception.message}');
    }
  }

  factory FirebaseFailure.fromFirebaseException(FirebaseException exception) {
    switch (exception.code) {
      case 'permission-denied':
        return FirebaseFailure('You do not have permission to perform this action.');
      case 'unavailable':
        return FirebaseFailure('Firebase services are temporarily unavailable.');
      case 'not-found':
        return FirebaseFailure('Requested resource not found.');
      case 'deadline-exceeded':
        return FirebaseFailure('Operation timed out.');
      default:
        return FirebaseFailure('Unexpected Firebase error: ${exception.message}');
    }
  }

  factory FirebaseFailure.fromException(dynamic exception) {
    if (exception is FirebaseAuthException) {
      return FirebaseFailure.fromFirebaseAuthException(exception);
    } else if (exception is FirebaseException) {
      return FirebaseFailure.fromFirebaseException(exception);
    } else {
      return FirebaseFailure('An unknown error occurred in Firebase: ${exception.toString()}');
    }
  }
}