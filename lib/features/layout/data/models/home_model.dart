import 'package:egy_tour/features/layout/data/models/country_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';

class HomeModel {
  final String id;
  final CountryModel country;
  final List<CountryModel> countries;
  final List<TourismModel> topTourist;
  final List<HotelModel> topHotels;

  HomeModel({
    required this.id,
    required this.country,
    required this.countries,
    required this.topTourist,
    required this.topHotels,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      country: CountryModel.fromJson(json['country']),
      countries: (json['countries'] as List)
          .map((e) => CountryModel.fromJson(e))
          .toList(),
      topTourist: (json['topTourist'] as List)
          .map((e) => TourismModel.fromJson(e))
          .toList(),
      topHotels: (json['topHotels'] as List)
          .map((e) => HotelModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country.toJson(),
      'countries': countries.map((e) => e.toJson()).toList(),
      'topTourist': topTourist.map((e) => e.toJson()).toList(),
      'topHotels': topHotels.map((e) => e.toJson()).toList(),
    };
  }
}
