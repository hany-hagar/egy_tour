import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';

class CountryModel {
  final String id;
  final String name;
  final List<String> images;
  final List<StateDataModel> states; 
  final List<HotelModel> hotels;
  final List<TourismModel> tickets;
  final List<CarModel> cars;
  final List<TourModel> tours;

  CountryModel({
    required this.id,
    required this.name,
    required this.images,
    required this.states,
    required this.hotels,
    required this.tickets,
    required this.cars,
    required this.tours,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      states: (json['states'] as List) 
          .map((e) => StateDataModel.fromJson(e))
          .toList(), 
      hotels: (json['hotels'] as List)
          .map((e) => HotelModel.fromJson(e))
          .toList(),
      tickets: (json['tickets'] as List)
          .map((e) => TourismModel.fromJson(e))
          .toList(),
      cars: (json['cars'] as List)
          .map((e) => CarModel.fromJson(e))
          .toList(),
      tours: (json['tours'] as List)
          .map((e) => TourModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'images': images,
        'states': states.map((e) => e.toJson()).toList(),
        'hotels': hotels.map((e) => e.toJson()).toList(),
        'tickets': tickets.map((e) => e.toJson()).toList(),
        'cars': cars.map((e) => e.toJson()).toList(),
        'tours': tours.map((e) => e.toJson()).toList(),
      };
}


class StateDataModel {
  final String id;
  final String image;
  final String name;
  final List<HotelModel> hotels;
  final List<TourismModel> tourismLocations;

  StateDataModel( {
    required this.image,
    required this.id,
    required this.name,
    required this.hotels,
    required this.tourismLocations,
  });

  factory StateDataModel.fromJson(Map<String, dynamic> json) {
    return StateDataModel(
      id: json['id'],
      image:json["image"],
      name: json['name'],
      hotels: (json['hotels'] as List)
          .map((e) => HotelModel.fromJson(e))
          .toList(),
      tourismLocations: (json['tourismLocations'] as List)
          .map((e) => TourismModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'hotels': hotels.map((e) => e.toJson()).toList(),
        'tourismLocations': tourismLocations.map((e) => e.toJson()).toList(),
      };
}
