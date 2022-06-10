import 'dart:async';
import 'dart:math';

import 'fish.dart';
import '../actions/aquarium_action.dart';

class Shark {
  Random random = Random.secure();
  late AquariumInterface aquariumInterface;

  Shark(this.aquariumInterface) {
    checking(aquariumInterface.getSizeFish());
  }

  checking(int amount) {
    if (aquariumInterface.getSizeFish() > 30) {
      Fish victim = aquariumInterface.getFish()[
          killing(aquariumInterface.getFishA(), aquariumInterface.getFishB())];
      victim.onDead("Shark killed 🦈");
      Timer(Duration(seconds: 5),
          () => checking(aquariumInterface.getSizeFish()));
    } else {
      Timer(Duration(seconds: 15),
          () => checking(aquariumInterface.getSizeFish()));
    }
  }

  String killing(List<String> listFishA, List<String> listFishB) {
    if (listFishA.length > listFishB.length + 10) {
      return listFishA[random.nextInt(listFishA.length)];
    } else if (listFishB.length > listFishA.length + 10) {
      return listFishB[random.nextInt(listFishB.length)];
    } else {
      var allName = [...listFishA, ...listFishB];
      return allName[random.nextInt(allName.length)];
    }
  }
}