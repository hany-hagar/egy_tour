part of 'social_cubit.dart';

@immutable
sealed class AppState {}

final class SocialInitial extends AppState {}

final class ChangeBottomNavigationBar extends AppState {}

final class SetImageLoading extends AppState {}
final class SetImageSuccess extends AppState {}
final class SetImageFailure extends AppState {
  final String error;
  SetImageFailure({required this.error});
}

final class SetProfileImageLoading extends AppState {}
final class SetProfileImageSuccess extends AppState {}
final class SetProfileImageFailure extends AppState {
  final String error;
  SetProfileImageFailure({required this.error});
}

final class SetCoverImageLoading extends AppState {}
final class SetCoverImageSuccess extends AppState {}
final class SetCoverImageFailure extends AppState {
  final String error;
  SetCoverImageFailure({required this.error});
}

final class UpdateDataLoading extends AppState {}
final class UpdateDataSuccess extends AppState {}
final class UpdateDataFailure extends AppState {
  final String error;
  UpdateDataFailure({required this.error});
}

final class LogoutLoading extends AppState {}
final class LogoutSuccess extends AppState {}
final class LogoutFailure extends AppState {
  final String error;
  LogoutFailure({required this.error});
}


final class DeleteAccountLoading extends AppState {}
final class DeleteAccountSuccess extends AppState {}
final class DeleteAccountFailure extends AppState {
  final String error;
  DeleteAccountFailure({required this.error});
}

final class UpdatePasswordLoading extends AppState {}
final class UpdatePasswordSuccess extends AppState {}
final class UpdatePasswordFailure extends AppState {
  final String error;
  UpdatePasswordFailure({required this.error});
}

final class UpdateHiveLoginDataLoading extends AppState {}
final class UpdateHiveLoginDataSuccess extends AppState {}
final class UpdateHiveLoginDataFailure extends AppState {
  final String error;
  UpdateHiveLoginDataFailure({required this.error});
}

final class SearchProduct extends AppState {}

final class AddProductReview extends AppState {}

final class SetState extends AppState{}

final class Booking extends AppState{}


final class AddFavItemLoading extends AppState {}
final class AddFavItemSuccess extends AppState {}
final class AddFavItemFailure extends AppState {
  final String error;
  AddFavItemFailure({required this.error});
}




