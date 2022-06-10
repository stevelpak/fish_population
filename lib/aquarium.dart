import 'animals/fish.dart';
import 'fish_type.dart';
import 'actions/aquarium_action.dart';
import 'animals/shark.dart';
import 'utils/utils.dart';
import 'utils/hive_util.dart';

class Aquarium with Util, HiveUtil implements AquariumInterface {
  Map<String, Fish> listFish = {};
  List<String> listFishMale = [];
  List<String> listFishFemale = [];
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
      printRequest(name, chosenFishName);
      Fish? chosenFish = listFish[chosenFishName];

      if (chosenFish!.onWill()) {
        printAccept(chosenFishName);

        FishType babyType = generateType();
        String newFishName = generateName(name, chosenFishName);
        Fish babyFish = Fish(babyType, newFishName, generateLifeTime(), this);

        listFish[newFishName] = babyFish;
        babyType == FishType.fishMale
            ? listFishMale.add(newFishName)
            : listFishFemale.add(newFishName);
        printBirth(babyType, newFishName);
        printAll(getSizeFish(), getSizeFishA());
      } else {
        printDecline(chosenFishName);
      }
    } catch (e) {
      printError(e);
    }
  }

  String randomFish(List<String> currentList) {
    return currentList[random.nextInt(currentList.length)];
  }

  @override
  onDead(FishType type, String name, String reason) {
    type == FishType.fishMale
        ? listFishMale.remove(name)
        : listFishFemale.remove(name);

    if (getSizeFishA() == 0 || getSizeFishB() == 0) {
      printExit();
    }

    listFish.remove(name);
    printDead(name, reason);
    printAll(getSizeFish(), getSizeFishA());
  }

  int generateLifeTime() {
    if (listFish.length < 20) {
      return random.nextInt(40) + 20;
    } else {
      return random.nextInt(30) + 10;
    }
    print('test');
  }

  @override
  getSizeFish() {
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
}
