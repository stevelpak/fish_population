import 'dart:io';
import 'dart:math';

import '../fish_type.dart';

String? mum, dad;

mixin Util {
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random random = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(random.nextInt(_chars.length))));

  String generateName(String first, String second) {
    mum = first;
    dad = second;
    String newName = first.substring((first.length ~/ 3) * 2) +
        second.substring((first.length ~/ 3) * 2) +
        getRandomString(first.length ~/ 3);

    return newName.toLowerCase();
  }

  FishType generateType() {
    if (random.nextBool()) {
      return FishType.fishMale;
    } else {
      return FishType.fishFemale;
    }
  }

  printRequest(String first, String second) {
    return "😍 $first attempt to $second";
  }

  printDecline(String second) {
    return "😒 $second didn't want to";
  }

  printAccept(String second) {
    return "🥳 $second accepted";
  }

  printBirth(FishType type, String name) {
    return "🐟 New Fish. Type: $type. Name: $name";
  }

  printDead(String name, String reason) {
    return "⚰️ $name is died. Reason: $reason";
  }

  printAll(int jami, int fishA) {
    return "FishA: $fishA. FishB: ${jami - fishA}. Total: $jami\n";
  }

  printExit() {
    return "One species of fish became extinct";
  }

  printError(e) {
    print(e);
    exit(0);
  }
}
