import 'package:hive/hive.dart';

mixin HiveUtil {
  Future addAllBox<T>(String boxName, Iterable<T> value) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    await box.addAll(value);
  }

  Future<Box<T>> getAllBox<T>(String boxName) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    return Future<Box<T>>.value(box);
  }

  Future<Box<T>> isCheckOpenBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return Future.value(Hive.openBox<T>(boxName));
    }
  }

  Future<bool> isEmptyBox<T>(String boxName) async {
    Box<T> box = await isCheckOpenBox<T>(boxName);
    return Future<bool>.value(box.isEmpty);
  }
}