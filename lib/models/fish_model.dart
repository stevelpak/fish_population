import 'package:hive/hive.dart';
part 'fish_model.g.dart';

@HiveType(typeId: 0)
class FishModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? deadReason;
  @HiveField(2)
  String? mummy;
  @HiveField(3)
  String? daddy;
  @HiveField(4)
  int? lifeTime;
  @HiveField(5)
  int? countChoose;
  @HiveField(6)
  DateTime? birthday;

  FishModel(
      {this.name,
      this.deadReason,
      this.mummy,
      this.daddy,
      this.lifeTime,
      this.countChoose,
      this.birthday});

  FishModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    deadReason = json['deadReason'];
    mummy = json['mummy'];
    daddy = json['daddy'];
    lifeTime = json['lifeTime'];
    countChoose = json['countChoose'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['deadReason'] = deadReason;
    data['mummy'] = mummy;
    data['daddy'] = daddy;
    data['lifeTime'] = lifeTime;
    data['countChoose'] = countChoose;
    data['birthday'] = birthday;

    return data;
  }
}
