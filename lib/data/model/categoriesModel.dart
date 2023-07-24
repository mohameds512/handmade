class CategoriesModel {
  int? id;
  Name? name;
  String? desc;
  String? image;
  String? img_route;

  CategoriesModel(
      {this.id,
        this.name,
        this.desc,
        this.image,
        this.img_route,
      });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    desc = json['desc'];
    image = json['image'];
    img_route = json['img_route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['img_route'] = this.img_route;
    return data;
  }
}
class Name {
  String? ar;
  String? en;
  String? du;

  Name({this.ar, this.en, this.du});

  Name.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    du = json['du'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    data['du'] = this.du;
    return data;
  }
}