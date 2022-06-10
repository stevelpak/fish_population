class FishModel {
  String? name, deadReason, mummy, daddy;
  int? lifeTime, countChoose;
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