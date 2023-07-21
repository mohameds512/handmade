class CategoriesModel {
  int? id;
  String? name;
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
    name = json['name'];
    desc = json['desc'];
    image = json['image'];
    img_route = json['img_route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['img_route'] = this.img_route;
    return data;
  }
}
