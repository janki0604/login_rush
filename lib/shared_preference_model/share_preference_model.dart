class PersonModel {
  List<InfoList>? infoList;

  PersonModel({
    this.infoList,
  });

  PersonModel.fromJson(Map<String, dynamic> json)
      : infoList = (json['info_list'] as List?)
            ?.map((dynamic e) => InfoList.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'info_list': infoList?.map((e) => e.toJson()).toList()};
}

class InfoList {
  final String? name;
  final String? number;

  InfoList({
    this.name,
    this.number,
  });

  InfoList.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
      };
}
