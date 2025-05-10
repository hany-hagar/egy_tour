
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:egy_tour/features/login/data/models/hive_user_model.dart';
import '../../const/data.dart';
import '../../features/splash/data/models/location_model.dart';

class HiveServices{
  final _locationBox  = Hive.openBox<LocationModel>(LocationBox);
  Future<Iterable<LocationModel>> fetchHiveLocation() async {
    var box = await _locationBox;
    return box.values.toList();
}
  Future<Iterable<LocationModel>> addHiveLocation(LocationModel model) async {
    var box = await _locationBox;
    await box.add(model);
    return box.values;
  }
  Future<Iterable<LocationModel>> updateHiveLocation(LocationModel model) async {
    var box = await _locationBox;
    await box.compact();
    await box.putAt(0, model);
    return box.values;
  }
  Future<void> deleteHiveLocation(LocationModel model) async {
    var box = await _locationBox;
    await box.delete(model.key);
    await box.compact();
  }



  final _loginDataBox  = Hive.openBox<HiveUserModel>(LoginBox);
  Future<Iterable<HiveUserModel>> fetchHiveLoginData() async {
    var box = await _loginDataBox;
    return box.values.toList();
  }

  Future<Iterable<HiveUserModel>> addHiveLoginData(HiveUserModel model) async {
    var box = await _loginDataBox;
    await box.add(model);
    return box.values;
  }

  Future<Iterable<HiveUserModel>> updateHiveLoginData(HiveUserModel model) async {
    var box = await _loginDataBox;
    await box.compact();
    await box.putAt(0, model);
    return box.values;
  }

  Future<void> deleteHiveLoginData(HiveUserModel model) async {
    var box = await _loginDataBox;
    await box.delete(model.key);
    await box.compact();
  }



  final _firstStateBox  = Hive.openBox<bool>('FirstState');
  Future<bool?> fetchFirstState({bool firstState = true}) async {
    var box = await _firstStateBox;
    return box.get('FirstState');
  }
  Future<bool?> setFirstState({bool firstState = true}) async {
    var box = await _firstStateBox;
    box.put("FirstState",firstState);
    return box.get('FirstState');
  }

}