import 'package:hive/hive.dart';

mixin HiveUtil {
  Future addAllBox<T>(String boxName, Iterable<T> value) async {
    LazyBox<T> box = await isCheckOpenBox<T>(boxName);
    await box.addAll(value);
    box.close();
  }

  Future<LazyBox<T>> getAllBox<T>(String boxName) async {
    LazyBox<T> box = await isCheckOpenBox<T>(boxName);
    return Future<LazyBox<T>>.value(box);
  }

  Future<LazyBox<T>> isCheckOpenBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.lazyBox<T>(boxName);
    } else {
      return Future.value(Hive.openLazyBox<T>(boxName));
    }
  }

  Future<bool> isEmptyBox<T>(String boxName) async {
    LazyBox<T> box = await isCheckOpenBox<T>(boxName);
    return Future<bool>.value(box.isEmpty);
  }
}
