import 'package:fish_population/models/fish_model.dart';

import 'animals/fish.dart';
import 'fish_type.dart';
import 'actions/aquarium_action.dart';
import 'animals/shark.dart';
import 'utils/utils.dart';
import 'utils/hive_util.dart';

const String fishStoreName = "fishStore";
const String logBoxName = "logStore";
DateTime? birthday;

class Aquarium with Util, HiveUtil implements AquariumInterface {
  List<FishModel> fishModel = [];
  Map<String, Fish> listFish = {};
  List<String> listFishMale = [];
  List<String> listFishFemale = [];
  List<String> logs = [];
  int countDead = 0;

  onStart() {
    Fish fishMale = Fish(FishType.fishMale, "Steven", generateLifeTime(), this);
    Fish fishFemale =
        Fish(FishType.fishFemale, "Barbie", generateLifeTime(), this);

    listFish[fishMale.name] = fishMale;
    listFish[fishFemale.name] = fishFemale;

    listFishMale.add(fishMale.name);
    listFishFemale.add(fishFemale.name);

    Shark(this);
  }

  @override
  onChosenFish(FishType type, String name, DateTime birthday) {
    try {
      String chosenFishName = (type == FishType.fishMale)
          ? randomFish(listFishFemale)
          : randomFish(listFishMale);
      print(printRequest(name, chosenFishName));
      logs.add(printRequest(name, chosenFishName));
      Fish? chosenFish = listFish[chosenFishName];

      if (chosenFish!.onWill()) {
        print(printAccept(chosenFishName));
        logs.add(printAccept(chosenFishName));

        FishType babyType = generateType();
        String newFishName = generateName(name, chosenFishName);
        Fish babyFish = Fish(babyType, newFishName, generateLifeTime(), this);

        listFish[newFishName] = babyFish;
        babyType == FishType.fishMale
            ? listFishMale.add(newFishName)
            : listFishFemale.add(newFishName);
        birthday = DateTime.now();

        print(printBirth(babyType, newFishName));
        logs.add(printBirth(babyType, newFishName));

        print(printAll(getSizeFish(), getSizeFishA()));
        logs.add(printAll(getSizeFish(), getSizeFishA()));
      } else {
        print(printDecline(chosenFishName));
        logs.add(printDecline(chosenFishName));
      }
    } catch (e) {
      printError(e);
    }
  }

  String randomFish(List<String> currentList) {
    return currentList[random.nextInt(currentList.length)];
  }

  @override
  onDead(FishType type, String name, String reason) async {
    type == FishType.fishMale
        ? listFishMale.remove(name)
        : listFishFemale.remove(name);

    if (getSizeFishA() == 0 || getSizeFishB() == 0) {
      print(printExit());
      logs.add(printExit());
    }

    var modelFish = FishModel(
        name: name,
        deadReason: reason,
        mummy: mum,
        daddy: dad,
        birthday: birthday);

    fishModel.add(modelFish);

    listFish.remove(name);
    print(printDead(name, reason));
    logs.add(printDead(name, reason));
    print(printAll(getSizeFish(), getSizeFishA()));
    logs.add(printAll(getSizeFish(), getSizeFishA()));
  }

  int generateLifeTime() {
    if (listFish.length < 20) {
      return random.nextInt(40) + 20;
    } else {
      return random.nextInt(30) + 10;
    }
  }

  @override
  getSizeFish() {
    if (logs.length > 1000) {
      lazyBoxFish(logs);
      logs.clear();
    }

    if (fishModel.length > 20) {
      addAllBox(fishStoreName, fishModel);
      fishModel.clear();
    }
    return listFish.length;
  }

  @override
  getSizeFishA() {
    return listFishMale.length;
  }

  @override
  List<String> getFishA() {
    return listFishMale;
  }

  @override
  List<String> getFishB() {
    return listFishFemale;
  }

  @override
  Map<String, Fish> getFish() {
    return listFish;
  }

  @override
  getSizeFishB() {
    return listFishFemale.length;
  }

  lazyBoxFish(List<String> log) {
    addAllBox(logBoxName, logs);
  }
}
