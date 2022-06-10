import 'package:fish_population/aquarium.dart';
import 'package:fish_population/models/fish_model.dart';

import 'package:hive/hive.dart';

void main(List<String> args) {
  Hive.init(
      "C:/Users/Muhammadqodir/Documents/Dart Projects/fish_population/lib/store");
  Hive.registerAdapter<FishModel>(FishModelAdapter());
  Aquarium().onStart();
}
