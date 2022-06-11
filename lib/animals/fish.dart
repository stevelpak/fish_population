import 'dart:async';
import 'dart:math';

import '../fish_type.dart';
import '../actions/aquarium_action.dart';
import '../actions/fish_action.dart';

class Fish implements FishInterface {
  late AquariumInterface aquariumInterface;
  final List<Timer> timerList = [];
  Random random = Random.secure();
  late FishType type;
  late int lifeTime;
  late String name;

  Fish(this.type, this.name, this.lifeTime, this.aquariumInterface) {
    onLive();
  }

  @override
  onLive() {
    Timer t =
        Timer(Duration(seconds: lifeTime), (() => onDead("Time is ended")));
    timerList.add(t);
    onChose();
  }

  @override
  onChose() {
    int chance;
    int time = 0;

    aquariumInterface.getSizeFish() < 20
        ? chance = random.nextInt(3) + 1
        : chance = random.nextInt(2) + 1;

    for (var i = 0; i < chance; i++) {
      int currentTime = random.nextInt(lifeTime) + 1;

      if (time != currentTime) {
        Timer t = Timer(Duration(seconds: currentTime),
            (() => aquariumInterface.onChosenFish(type, name, DateTime.now())));
        time = currentTime;
        timerList.add(t);
      } else {
        i--;
        continue;
      }
    }
  }

  @override
  onDead(String reason) {
    for (var time in timerList) {
      time.cancel();
    }

    aquariumInterface.onDead(type, name, reason);
  }

  @override
  onWill() {
    if (aquariumInterface.getSizeFishA() < 14 ||
        aquariumInterface.getSizeFishB() < 14) {
      return true;
    } else {
      return random.nextBool();
    }
  }
}
