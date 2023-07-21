class CategoriesModel {
  int? id;
  String? name;
  String? desc;
  Null? image;

  CategoriesModel(
      {this.id,
        this.name,
        this.desc,
        this.image,});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    return data;
  }
}
